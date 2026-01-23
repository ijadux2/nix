{ pkgs, ... }:

{
  programs.nixvim.plugins = {
    # UI Plugins
    web-devicons.enable = true;
    lualine = {
      enable = true;
      settings = {
        options = {
          theme = "catppuccin";
          icons_enabled = true;
          section_separators = {
            left = "";
            right = "";
          };
          component_separators = {
            left = "";
            right = "";
          };
        };
      };
    };
    bufferline.enable = true;
    which-key.enable = true;

    # LazyVim-inspired plugins
    nvim-autopairs.enable = true;
    nvim-colorizer.enable = true;
    nvim-highlight-colors.enable = true;
    gitsigns.enable = true;
    todo-comments.enable = true;
    trouble.enable = true;
    illuminate.enable = true;
    nui.enable = true;
    nvim-notify.enable = true;
    indent-blankline = {
      enable = true;
      settings = {
        scope = {
          enabled = true;
          show_start = false;
          show_end = false;
        };
        indent = {
          char = "│";
          tab_char = "│";
        };
        exclude = {
          filetypes = [
            "help"
            "alpha"
            "dashboard"
            "neo-tree"
            "Trouble"
            "trouble"
            "lazy"
            "mason"
            "notify"
            "toggleterm"
            "lazyterm"
          ];
        };
      };
    };

    # Comment.nvim
    comment.enable = true;

    # Treesitter
    treesitter = {
      enable = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        # Core languages
        nix
        python
        typescript
        javascript
        tsx
        lua
        json
        yaml
        markdown
        markdown_inline
        css
        html
        c
        cpp
        bash
        vim
        vimdoc
        nu
        # Additional languages
        rust
        go
        java
        php
        ruby
        sql
        dockerfile
        toml
        xml
        cmake
        make
        dart
        regex
        query
      ];
    };

    # Telescope
    telescope.enable = true;
    # Neo-tree
    neo-tree.enable = true;
    # Snacks
    snacks.enable = true;

    # Mini.nvim
    mini.enable = true;

    # React Native development plugins
    nvim-dap.enable = true;
    nvim-dap-ui.enable = true;
    nvim-dap-virtual-text.enable = true;

    # React/TypeScript specific plugins
    typescript-tools.enable = true;
    markdown-preview.enable = true;
    # Formatting and linting
    conform-nvim.enable = true;
    nvim-lint.enable = true;

    # Auto-completion enhancement plugins
    nvim-cmp.enable = true;
  };
}
