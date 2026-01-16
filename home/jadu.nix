{
  pkgs,
  inputs,
  ...
}:

{

  imports = [
    ./home.nix
    ./pkgs.nix
    ./nix/plugins.nix
    ./nix/cmp.nix
    ./nix/custom.nix
    ./nix/keybind.nix
  ];

  programs.nixvim = {
    enable = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
      have_nerd_font = true;
      miniicons_enable = true;
    };

    colorschemes.catppuccin.enable = true;

    opts = {
      number = true;
      relativenumber = true;
      signcolumn = "yes";
      cursorline = true;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
      smartindent = true;
      wrap = false;
      scrolloff = 8;
      termguicolors = true;
      clipboard = "unnamedplus";

      # LazyVim-inspired optimizations
      updatetime = 250;
      timeoutlen = 300;
      breakindent = true;
      undofile = true;
      ignorecase = true;
      smartcase = true;
      showmode = false;
      pumheight = 10;
    };

    extraPlugins = with pkgs.vimPlugins; [
      snacks-nvim
      plenary-nvim
      telescope-nvim
      nvim-web-devicons
      luasnip
    ];

    plugins = {
      # LSP servers configuration
      lsp = {
        enable = true;
        servers = {
          # Nix
          nil_ls = {
            enable = true;
            settings.formatting.command = [ "nixfmt" ];
          };

          # Python
          pyright = {
            enable = true;
            settings.python.analysis = {
              typeCheckingMode = "basic";
              autoSearchPaths = true;
            };
          };

          # TypeScript/JavaScript
          ts_ls = {
            enable = true;
            filetypes = [
              "javascript"
              "javascriptreact"
              "typescript"
              "typescriptreact"
            ];
          };

          # Lua
          lua_ls = {
            enable = true;
            settings.Lua.hint.enable = true;
          };

          # Web
          cssls.enable = true;
          jsonls.enable = true;
          html.enable = true;

          # C/C++
          clangd = {
            enable = true;
            settings = {
              fallbackFlags = [ "-std=c++20" ];
            };
          };

          # Shell
          bashls = {
            enable = true;
            settings = {
              bashIde = {
                enable = true;
                globPattern = "*.{sh,bash,zsh}";
              };
            };
          };

          # Vim
          vimls.enable = true;
        };
      };

      # Formatting configuration
      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            nix = [ "nixfmt" ];
            python = [
              "black"
              "isort"
            ];
            javascript = [ "prettier" ];
            typescript = [ "prettier" ];
            javascriptreact = [ "prettier" ];
            typescriptreact = [ "prettier" ];
            json = [ "prettier" ];
            yaml = [ "prettier" ];
            markdown = [ "prettier" ];
            css = [ "prettier" ];
            html = [ "prettier" ];
            lua = [ "stylua" ];
            sh = [ "shfmt" ];
            cpp = [ "clang-format" ];
            c = [ "clang-format" ];
          };
          format_on_save = {
            timeout_ms = 500;
            lsp_fallback = true;
          };
        };
      };
    };
  };

}
