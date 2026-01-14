{ config, pkgs, ... }:

{
  programs.nixvim.plugins = {
    # LSP customizations
    lsp = {
      keymaps = {
        silent = true;
        lspBuf = {
          gd = "definition";
          gr = "references";
          gI = "implementation";
          gD = "type_definition";
          K = "hover";
          "<leader>ca" = "code_action";
          "<leader>rn" = "rename";
          "<leader>f" = "format";
        };
        diagnostic = {
          "<leader>e" = "open_float";
          "[d" = "goto_prev";
          "]d" = "goto_next";
        };
      };
    };

    # Telescope customizations
    telescope = {
      keymaps = {
        "<leader>g" = "live_grep";
        "<leader>fb" = "buffers";
        "<leader>fh" = "help_tags";
      };
    };

    # Snacks customizations
    snacks = {
      enable = true;
      config = {
        bigfile = {
          enabled = true;
        };
        notifier = {
          enabled = true;
        };
        quickfile = {
          enabled = true;
        };
        statuscolumn = {
          enabled = true;
        };
        words = {
          enabled = true;
        };
      };
    };

    # Mini.nvim customizations
    mini = {
      enable = true;
      modules = {
        basics = { };
        comment = { };
        pairs = { };
        surround = { };
        tabline = { };
        misc = { };
        icons = { };
      };
      mockDevIcons = true;
    };

    # Neo-tree customizations
    neo-tree = {
      config.close_if_last_window = true;
    };

    # Todo-comments customizations with LSP integration
    todo-comments = {
      enable = true;
      settings = {
        signs = true;
        sign_priority = 8;
        keywords = {
          FIX = {
            icon = " ";
            color = "error";
            alt = [
              "FIXME"
              "BUG"
              "FIXIT"
              "ISSUE"
            ];
          };
          TODO = {
            icon = " ";
            color = "info";
          };
          HACK = {
            icon = " ";
            color = "warning";
          };
          WARN = {
            icon = " ";
            color = "warning";
            alt = [
              "WARNING"
              "XXX"
            ];
          };
          PERF = {
            icon = " ";
            alt = [
              "OPTIM"
              "PERFORMANCE"
              "OPTIMIZE"
            ];
          };
          NOTE = {
            icon = " ";
            color = "hint";
            alt = [ "INFO" ];
          };
          TEST = {
            icon = "⏲";
            color = "test";
            alt = [
              "TESTING"
              "PASSED"
              "FAILED"
            ];
          };
        };
        highlight = {
          multiline = true;
          multiline_pattern = "^.";
          multiline_context = 10;
          before = "";
          keyword = "wide";
          after = "fg";
          pattern = [
            ".*<(key).*"
            ".*<(fix).*"
          ];
          comments_only = true;
          max_line_len = 400;
          exclude = [ "markdown" ];
        };
        colors = {
          error = [
            "DiagnosticError"
            "ErrorMsg"
            "#DC2626"
          ];
          warning = [
            "DiagnosticWarn"
            "WarningMsg"
            "#FBBF24"
          ];
          info = [
            "DiagnosticInfo"
            "#2563EB"
          ];
          hint = [
            "DiagnosticHint"
            "#10B981"
          ];
          default = [
            "Identifier"
            "#7C3AED"
          ];
          test = [
            "Identifier"
            "#FF00FF"
          ];
        };
        search = {
          command = "rg";
          args = [
            "--color=never"
            "--no-heading"
            "--with-filename"
            "--line-number"
            "--column"
          ];
          pattern = "\\b(KEYWORDS):\\b";
        };
      };
    };

    # Trouble customizations
    trouble = {
      enable = true;
      settings = {
        position = "bottom"; # bottom | left | right | top
        height = 20;
        use_diagnostic_signs = true;
      };
    };
  };
}
