{...}: let
  files = builtins.readDir ./.;
  names = builtins.attrNames files;
  nixFiles =
    builtins.filter
    (name: name != "default.nix" && builtins.match ".*\\.nix" name != null)
    (builtins.attrNames files);
  dirs =
    builtins.filter
    (name: files.${name} == "directory")
    names;
  imports = (map (name: ./. + "/${name}") nixFiles) ++ (map (name: ./. + "/${name}") dirs);
in {
  imports = imports;

  plugins.crates = {
    enable = true;
    settings = {
      autoload = true;
      autoupdate = true;
      smart_indent = true;
    };
  };

  plugins.gitsigns = {
    enable = true;
    settings = {
      current_line_blame = true;
      signcolumn = true;
      signs = {
        add.text = "+";
        change.text = "~";
        delete.text = "-";
        untracked.text = "┆";
      };
      watch_gitdir.follow_files = true;
    };
  };
}
