{...}: {
  imports = [
    ./todo.nix
    ./trouble.nix
  ];

  plugins.vim-surround.enable = true;
  plugins.trim.enable = true;
  plugins.mini.enable = true;

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
