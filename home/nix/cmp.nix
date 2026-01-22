{ config, pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      # 1. Enable the snippet engine (Required for cmp to work)
      luasnip = {
        enable = true;
        settings = {
          enable_autosnippets = true;
        };
      };
      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp_luasnip.enable = true;
      cmp-cmdline.enable = true;
      cmp-git.enable = true;

      # Rust-specific completion
      crates-nvim = {
        enable = true;
        settings = {
          src = {
            cmp = {
              enabled = true;
            };
          };
        };
      };

      # Add Rust code snippets
      friendly-snippets.enable = true;

      # 2. Configure nvim-cmp
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          snippet = {
            expand = "function(args) require('luasnip').lsp_expand(args.body) end";
          };

          completion = {
            completeopt = "menu,menuone,noinsert";
          };
          # Enhanced sources with auto-completion for beginners
          sources = [
            {
              name = "nvim_lsp";
              priority = 1000;
              keyword_length = 1;
              max_item_count = 20;
            } # Code completion from LSP
            {
              name = "crates";
              priority = 900;
              keyword_length = 1;
            } # Rust crate completion
            {
              name = "luasnip";
              priority = 850;
              keyword_length = 1;
            } # Snippets
            {
              name = "path";
              priority = 600;
              keyword_length = 1;
            } # File system paths
            {
              name = "buffer";
              priority = 400;
              keyword_length = 1;
            } # Text within current buffer
          ];

          # Enhanced keybindings for beginner-friendly auto-completion
          mapping = {
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-e>" = "cmp.mapping.close()";
            # Enter key to accept completion
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            # Arrow keys for navigation
            "<Down>" = "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })";
            "<Up>" = "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })";
            # Manual trigger
            "<C-space>" = "cmp.mapping.complete()";
            # Tab for snippet expansion (not completion navigation)
            "<Tab>" =
              "cmp.mapping(function(fallback)\n              if require('luasnip').expand_or_locally_jumpable() then\n                -- Try to expand snippet\n                require('luasnip').expand_or_jump()\n              else\n                -- Otherwise, insert tab\n                fallback()\n              end\n            end, { 'i', 's' })";
            "<S-Tab>" =
              "cmp.mapping(function(fallback)\n              if require('luasnip').locally_jumpable(-1) then\n                require('luasnip').jump(-1)\n              else\n                fallback()\n              end\n            end, { 'i', 's' })";
            # Auto-trigger on typing
            "<C-y>" = "cmp.mapping.confirm({ select = true })";
          };

          # Enhanced window configuration for better visibility
          window = {
            completion.border = "rounded";
            documentation.border = "rounded";
          };
          # Enable preselection for better UX
          preselect = "cmp.PreselectMode.Item";
        };
      };
    };
  };
}
