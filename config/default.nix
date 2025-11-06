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
in {
  imports = [
    ./options.nix
    ./keymaps.nix
    ./plugins/lsp.nix

    ./plugins/ui
    ./plugins/utils
  ];

  extraPackages = packages;

  globals = {
    maploader = " ";
    maplocalloader = " ";

    loaded_python_provider = 0;
  };

  highlight.ExtraWhitespace.bg = "red";
  match.ExtraWhitespace = "\\s\\+$";
}
