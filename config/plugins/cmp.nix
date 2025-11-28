{lib, ...}: {
  plugins.cmp = {
    enable = true;
    settings = {
      autoEnableSources = true;
      perforamnce.debounce = 150;

      sources = [
        {
          name = "nvim_lsp";
          keywordLength = 3;
        }
        {
          name = "buffer";
          keywordLength = 3;
        }
        {
          name = "path";
          keywordLength = 3;
        }
        {
          name = "luasnip";
          keywordLength = 3;
        }
        {
          name = "emoji";
          keywordLength = 3;
        }
      ];

      formatting.fields = ["abbr" "kind" "menu"];

      mapping = lib.mkForce {
        "<CR>" = "cmp.mapping.confirm({select = false})";

        "<Up>" = "cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Insert})";
        "<Down>" = "cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Insert})";

        "<C-Up>" = "cmp.mapping.scroll_docs(-4)";
        "<C-Down>" = "cmp.mapping.scroll_docs(4)";

        "<C-Space>" = ''
          cmp.mapping(
            function(fallback)
              local col = vim.fn.col('.') - 1

              if cmp.visible() then
                cmp.select_next_item(select_opts)
              elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                fallback()
              else
                cmp.complete()
              end
            end,
            { "i", "s" }
          )
        '';
      };

      window = {
        completion = {
          border = "rounded";
          winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None";
          zindex = 1001;
          scrolloff = 0;
          colOffset = 0;
          sidePadding = 1;
          scrollbar = true;
        };
        documentation = {
          border = "rounded";
          winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None";
          zindex = 1002;
          maxHeight = 20;
        };
      };
    };
  };
  plugins.mini-surround.enable = true;
  # plugins.mini-completion.enable = true;
}
