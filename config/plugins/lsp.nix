{
  lib,
  pkgs,
  ...
}: {
  plugins.lsp = {
    enable = true;
    inlayHints = true;
    servers = {
      bashls.enable = true;
      csharp_ls.enable = true;
      cssls.enable = true;
      docker_compose_language_service.enable = true;
      dockerls.enable = true;
      eslint.enable = true;
      gopls.enable = true;
      html.enable = true;
      java_language_server.enable = true;
      jsonls.enable = true;
      lua_ls.enable = true;
      marksman.enable = true;
      nil_ls.enable = true;
      pylsp.enable = true;
      pyright.enable = true;
      rust_analyzer = {
        enable = true;
        installCargo = false;
        installRustc = false;
      };
      tailwindcss.enable = true;
      ts_ls.enable = true;
      yamlls.enable = true;
      zls = {
        enable = true;
        package = null;
        cmd = ["zls"];
      };
    };

    keymaps = {
      diagnostic = {
        "<leader>E" = "open_float";
        "[" = "goto_prev";
        "]" = "goto_next";
        "<leader>do" = "setloclist";
      };
      lspBuf = {
        "K" = "hover";
        "gD" = "declaration";
        "gd" = "definition";
        "gr" = "references";
        "gI" = "implementation";
        "gy" = "type_definition";
        "<leader>ca" = "code_action";
        "<leader>cr" = "rename";
        "<leader>wl" = "list_workspace_folders";
        "<leader>wr" = "remove_workspace_folder";
        "<leader>wa" = "add_workspace_folder";
      };
    };
  };

  plugins.lint = {
    enable = true;
    lintersByFt = {
      text = ["vale"];
      json = ["jsonlint"];
      markdown = ["prettier"];
      dockerfile = ["hadolint"];
      bash = ["shellcheck"];
      yaml = ["yamlfmt"];
      # nix = ["alejandra"];
      go = ["golangci-lint"];
      python = ["flake8"];
      lua = ["selene"];
    };
    linters = {
      hadolint = {
        cmd = "${pkgs.hadolint}/bin/hadolint";
      };
    };
  };

  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        lsp_fallback = "fallback";
        timeout_ms = 500;
      };

      formatters_by_ft = {
        css = ["prettier"];
        docker = ["hadolint"];
        html = ["prettier"];
        json = ["prettier"];
        lua = ["stylua"];
        markdown = ["prettier"];
        nix = ["alejandra"];
        python = ["isort" "black"];
        sh = ["shfmt"];
        yaml = ["prettier"];
      };
    };
  };

  plugins.treesitter = {
    enable = true;
    nixvimInjections = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;

    settings = {
      auto_install = true;
      indent.enable = true;
      highlight.enable = true;
    };
  };
  plugins.treesitter-context.enable = true;
  plugins.rainbow-delimiters.enable = true;
  plugins.nix.enable = true;
}
