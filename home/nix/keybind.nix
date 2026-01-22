{ config, pkgs, ... }:

{
  programs.nixvim.keymaps = [
    # Neo-tree toggle
    {
      key = "\\";
      action = "<cmd>Neotree toggle<CR>";
      mode = "n";
      options = {
        noremap = true;
        silent = true;
        desc = "Toggle Neo-tree";
      };
    }
    # Easy escape
    {
      mode = "n";
      key = "<leader>t";
      action = "<cmd>terminal<cr>";
    }

    {
      mode = "n";
      key = "<S-s>";
      action = "30k";
    }
    {
      mode = "n";
      key = "<S-d>";
      action = "30j";
    }
    {
      mode = "n";
      key = "<S-c>";
      action = "<cmd>Trouble diagnostics toggle<cr>";
      options.desc = "Diagnostics (Trouble)";
    }
    # Bufferline navigation
    {
      mode = "n";
      key = "<Tab>";
      action = "<Cmd>BufferLineCycleNext<CR>";
    }
    {
      mode = "n";
      key = "<S-Tab>";
      action = "<Cmd>BufferLineCyclePrev<CR>";
      options.desc = "Previous buffer";
    }
    # Comment.nvim keybindings
    {
      mode = "v";
      key = "<leader>c";
      action.__raw = "function() require('Comment.api').toggle.linewise(vim.fn.visualmode()) end";
      options.desc = "Toggle comment for selection";
    }
    # Additional keybindings
    {
      mode = "n";
      key = "<leader><leader>";
      action.__raw = "function() require('telescope.builtin').find_files() end";
      options.desc = "Find files";
    }
    {
      mode = "n";
      key = "<leader>w";
      action = "<CMD>w<CR>";
      options.desc = "Write";
    }
    {
      mode = "n";
      key = "<leader>x";
      action = "<CMD>bdelete<CR>";
      options.desc = "Close Buffer";
    }
    {
      mode = "n";
      key = "<leader>r";
      action.__raw = "function() require('telescope.builtin').oldfiles() end";
      options.desc = "Recent files";
    }
    {
      mode = "n";
      key = "<leader>|";
      action = "<CMD>vsplit<CR>";
      options.desc = "Split Right";
    }
    {
      mode = "n";
      key = "<leader>-";
      action = "<CMD>split<CR>";
      options.desc = "Split Below";
    }
    # Navigation
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options.desc = "Go to Left Window";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options.desc = "Go to Lower Window";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options.desc = "Go to Upper Window";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options.desc = "Go to Right Window";
    }
    # Resize
    {
      mode = "n";
      key = "<C-Up>";
      action = "resize +2";
      options.desc = "Increase Window Height";
    }
    {
      mode = "n";
      key = "<C-Down>";
      action = "resize -2";
      options.desc = "Decrease Window Height";
    }
    {
      mode = "n";
      key = "<C-Left>";
      action = "vertical resize -2";
      options.desc = "Decrease Window Width";
    }
    {
      mode = "n";
      key = "<C-Right>";
      action = "vertical resize +2";
      options.desc = "Increase Window Width";
    }

    # Rust-specific keybindings
    {
      mode = "n";
      key = "<leader>rr";
      action = "<cmd>RustRunnables<cr>";
      options.desc = "Rust runnables";
    }
    {
      mode = "n";
      key = "<leader>rd";
      action = "<cmd>RustDebuggables<cr>";
      options.desc = "Rust debuggables";
    }
    {
      mode = "n";
      key = "<leader>rt";
      action = "<cmd>RustTest<cr>";
      options.desc = "Rust test";
    }
    {
      mode = "n";
      key = "<leader>rm";
      action = "<cmd>RustExpandMacro<cr>";
      options.desc = "Rust expand macro";
    }
    {
      mode = "n";
      key = "<leader>rh";
      action = "<cmd>RustHoverActions<cr>";
      options.desc = "Rust hover actions";
    }
    {
      mode = "n";
      key = "<leader>rc";
      action = "<cmd>RustOpenCargo<cr>";
      options.desc = "Open Cargo.toml";
    }
    {
      mode = "n";
      key = "<leader>rp";
      action = "<cmd>RustParentModule<cr>";
      options.desc = "Rust parent module";
    }

  ];
}
