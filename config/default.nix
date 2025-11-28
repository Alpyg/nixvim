{pkgs, ...}: let
  packages = with pkgs; [
    alejandra
    black
    hadolint
    isort
    nixfmt-classic
    nixpkgs-fmt
    prettierd
    python312Packages.autopep8
    python312Packages.flake8
    ripgrep
    shfmt
    stylua
    wl-clipboard
    xdg-utils
    yapf
  ];

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

  extraPackages = packages;

  globals = {
    maploader = " ";
    maplocalloader = " ";

    loaded_python_provider = 0;
  };

  highlight.ExtraWhitespace.bg = "red";
  match.ExtraWhitespace = "\\s\\+$";
}
