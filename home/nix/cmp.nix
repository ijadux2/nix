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

      # 2. Configure nvim-cmp
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          snippet = {
            expand = "function(args) require('luasnip').lsp_expand(args.body) end";
          };

          completion = {
            completeopt = "menu,menuone,noselect";
          };
          # LazyVim-style sources with priorities
          sources = [
            {
              name = "nvim_lsp";
              priority = 900;
            } # Code completion from LSP
            {
              name = "luasnip";
              priority = 750;
            } # Snippets
            {
              name = "path";
              priority = 500;
            } # File system paths
            {
              name = "buffer";
              priority = 250;
            } # Text within current buffer
          ];

          # Keybindings with arrow keys for navigation
          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-e>" = "cmp.mapping.close()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<Down>" = "cmp.mapping.select_next_item()";
            "<Up>" = "cmp.mapping.select_prev_item()";
            "<Tab>" =
              "cmp.mapping(function(fallback)\n              if cmp.visible() then\n                cmp.select_next_item()\n              elseif require('luasnip').expand_or_locally_jumpable() then\n                require('luasnip').expand_or_jump()\n              else\n                fallback()\n              end\n            end, { 'i', 's' })";
            "<S-Tab>" =
              "cmp.mapping(function(fallback)\n              if cmp.visible() then\n                cmp.select_prev_item()\n              elseif require('luasnip').locally_jumpable(-1) then\n                require('luasnip').jump(-1)\n              else\n                fallback()\n              end\n            end, { 'i', 's' })";
          };

          # Bordered windows (optional, but looks better)
          window = {
            completion.border = "rounded";
            documentation.border = "rounded";
          };
        };
      };
    };
  };
}
