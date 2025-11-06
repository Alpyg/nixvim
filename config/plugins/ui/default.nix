{...}: {
  imports = [
    ./bufferline.nix
    ./floaterm.nix
    ./lualine.nix
    ./neotree.nix
    ./noice.nix
    ./telescope.nix
    ./theme.nix
    ./whichkey.nix
  ];

  plugins.web-devicons.enable = true;
}
