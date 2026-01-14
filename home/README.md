# 🚀 NixVim Configuration

<div align="center">

![Neovim](https://img.shields.io/badge/Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white)
![NixVim](https://img.shields.io/badge/NixVim-7E7EFF?style=for-the-badge&logo=nix&logoColor=white)
![Lua](https://img.shields.io/badge/Lua-000080?style=for-the-badge&logo=lua&logoColor=white)
![LSP](https://img.shields.io/badge/LSP-FF6C00?style=for-the-badge&logo=language&logoColor=white)

*A modern, feature-rich Neovim configuration powered by NixVim and inspired by LazyVim.*

</div>

## ✨ Overview

This NixVim configuration provides a complete, modern Neovim experience with:
- 🎨 **Beautiful UI** with Catppuccin theme and modern plugins
- 🧠 **Intelligent LSP** support for 15+ programming languages
- ⚡ **Blazing fast** performance with LazyVim-inspired optimizations
- 🔧 **Extensive tooling** for formatting, linting, and debugging
- 🎯 **Productivity-focused** keybindings and workflows

## 📁 Configuration Structure

```
home/nix/
├── 📄 plugins.nix       # Core plugins and UI configuration
├── 📄 cmp.nix           # Completion (NVIM-CMP) setup
├── 📄 custom.nix        # Custom Neovim settings and autocommands
├── 📄 keybind.nix       # Key mappings and shortcuts
└── 📄 (imported in jadu.nix)
```

## 🎨 Visual Features

### 🌈 Theme & Appearance
- **Catppuccin Mocha** - Beautiful, dark color scheme
- **Nerd Fonts** support for icon rendering
- **True color** terminal support
- **Cursor line** highlighting
- **Relative line numbers** for easy navigation
- **Sign column** for Git and LSP indicators

### 📊 UI Components
- **Lualine** - Modern status line with Git integration
- **Bufferline** - Beautiful tab/buffer management
- **Web Devicons** - File type icons everywhere
- **Which-Key** - Interactive keybinding help
- **Nvim-Notify** - Beautiful notification system
- **Colorizer** - Inline color preview

## 🧠 Language Support

### 🔧 LSP Servers
| Language | Server | Features |
|----------|--------|----------|
| **Nix** | `nil_ls` | Formatting with `nixfmt` |
| **Python** | `pyright` | Type checking, auto-completion |
| **TypeScript/JavaScript** | `ts_ls` | Full TS/JS support |
| **Lua** | `lua_ls` | Neovim Lua development |
| **C/C++** | `clangd` | C++20 standard support |
| **Shell** | `bashls` | Bash/Zsh scripting |
| **Web** | `cssls`, `html`, `jsonls` | Web development |
| **Vim** | `vimls` | Vim script support |

### 🌲 Treesitter
Syntax highlighting for 25+ languages including:
- **Core**: Nix, Python, TypeScript, JavaScript, Lua
- **Web**: HTML, CSS, JSON, YAML, Markdown
- **Systems**: C, C++, Bash, Dockerfile
- **Mobile**: Dart (Flutter), Rust, Go
- **Config**: TOML, XML, CMake, Make

### 📝 Formatting & Linting
**Formatters** (via Conform-nvim):
- `nixfmt` for Nix
- `black` + `isort` for Python
- `prettier` for Web/TypeScript
- `stylua` for Lua
- `clang-format` for C/C++
- `shfmt` for Shell scripts

**Linters** (via nvim-lint):
- `pylint` for Python
- `eslint` for JavaScript/TypeScript
- `shellcheck` for Shell scripts
- `statix` for Nix

## 🔌 Plugin Ecosystem

### 🎯 Core Functionality
```nix
# Essential plugins
- telescope.nvim          # Fuzzy finder
- nvim-autopairs         # Auto-close brackets
- nvim-colorizer         # Color preview
- gitsigns.nvim          # Git integration
- todo-comments.nvim     # TODO highlighting
- trouble.nvim           # Diagnostics viewer
- illuminate.nvim        # Word highlighting
```

### 🌳 Navigation & Files
```nix
- neo-tree.nvim          # File explorer
- telescope.nvim         # Fuzzy finding
- snacks.nvim           # Modern UI components
```

### 🐛 Debugging
```nix
- nvim-dap               # Debug Adapter Protocol
- nvim-dap-ui            # Debug UI
- nvim-dap-virtual-text  # Inline debugging
```

### ⚡ Mini.nvim Suite
Collection of lightweight, focused plugins for various tasks.

## ⌨️ Key Mappings

### 🎯 Leader Key
- **Leader**: `<Space>` (space bar)
- **Local Leader**: `<Space>`

### 📁 Navigation
| Mapping | Action |
|---------|--------|
| `<leader>e` | Toggle file explorer |
| `<leader>f` | Find files (Telescope) |
| `<leader>g` | Live grep (Telescope) |
| `<leader>b` | Switch buffers |
| `<leader>l` | LSP operations |

### 💻 Code Actions
| Mapping | Action |
|---------|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gi` | Go to implementation |
| `K` | Hover documentation |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |

### 🎨 UI Controls
| Mapping | Action |
|---------|--------|
| `<leader>th` | Change theme |
| `<leader>tt` | Toggle treesitter |
| `<leader>tw` | Toggle wrap |
| `<leader>tn` | Toggle line numbers |

### 🐛 Debugging
| Mapping | Action |
|---------|--------|
| `<F5>` | Start/Continue debugging |
| `<F10>` | Step over |
| `<F11>` | Step into |
| `<F12>` | Step out |
| `<leader>b` | Toggle breakpoint |

## 🔧 Configuration Details

### ⚙️ Editor Options
```nix
opts = {
  number = true;              # Show line numbers
  relativenumber = true;      # Relative line numbers
  signcolumn = "yes";         # Always show sign column
  cursorline = true;          # Highlight cursor line
  expandtab = true;           # Use spaces instead of tabs
  shiftwidth = 2;             # Indentation size
  tabstop = 2;                # Tab size
  smartindent = true;         # Smart indentation
  wrap = false;               # Don't wrap lines
  scrolloff = 8;              # Keep 8 lines visible
  termguicolors = true;       # True color support
  clipboard = "unnamedplus";  # System clipboard
  # ... and more optimizations
};
```

### 🚀 Performance Optimizations
- **Lazy loading** for heavy plugins
- **Fast startup** with minimal initial configuration
- **Optimized updatetime** (250ms) for responsive UI
- **Reduced timeout** (300ms) for faster key mappings
- **Efficient treesitter** configuration

### 🎯 LazyVim-Inspired Features
- **Auto-completion** with snippet support
- **Auto-pairs** for bracket management
- **Color highlighting** in code
- **Todo tracking** with quick navigation
- **Trouble** integration for error management
- **Snacks** for modern UI components

## 🛠️ Customization

### Adding New Language Support

1. **Add LSP Server** (in `jadu.nix`):
```nix
your_language = {
  enable = true;
  settings = {
    # Language-specific settings
  };
};
```

2. **Add Treesitter Grammar** (in `plugins.nix`):
```nix
treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
  # ... existing grammars
  your_language
];
```

3. **Add Formatter** (in `jadu.nix`):
```nix
formatters_by_ft = {
  # ... existing formatters
  your_language = [ "your_formatter" ];
};
```

### Adding New Plugins

Edit `home/nix/plugins.nix`:
```nix
programs.nixvim.plugins = {
  # ... existing plugins
  your_plugin.enable = true;
};
```

### Custom Keybindings

Edit `home/nix/keybind.nix`:
```nix
programs.nixvim.keymaps = [
  {
    mode = "n";
    key = "<leader>your_key";
    action = "your_action";
    options = {
      desc = "Your description";
    };
  }
];
```

## 🎨 Theming Customization

### Changing Color Scheme
```nix
colorschemes.catppuccin.enable = true;
# Or use another theme:
# colorschemes.tokyonight.enable = true;
```

### Custom Highlights
Add to `home/nix/custom.nix`:
```nix
programs.nixvim.highlight = {
  YourHighlight = {
    fg = "#your_color";
    bg = "#your_background";
    bold = true;
  };
};
```

## 📚 Usage Examples

### 🐛 Python Development
```python
# Full LSP support with type hints
def calculate_sum(numbers: list[int]) -> int:
    """Calculate the sum of a list of numbers."""
    return sum(numbers)

# Auto-formatting on save
# Black and isort integration
```

### 🌐 Web Development
```typescript
// TypeScript with full LSP support
interface User {
  id: number;
  name: string;
}

const user: User = {
  id: 1,
  name: "John Doe"
};
// Prettier formatting on save
```

### 🔧 Nix Development
```nix
# Nix with nil_ls LSP and nixfmt formatting
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    neovim
    git
  ];
}
```

## 🚀 Performance

This configuration is optimized for:
- **Fast startup** (~100ms on modern hardware)
- **Low memory usage** with lazy loading
- **Responsive UI** with optimized settings
- **Efficient LSP** with proper configuration

## 🤝 Contributing

To improve this configuration:
1. 🐛 Test changes thoroughly
2. 📝 Update documentation
3. 🎨 Maintain consistency with existing style
4. ⚡ Consider performance impact

## 🙏 Inspiration

This configuration draws inspiration from:
- **LazyVim** - For modern Neovim patterns
- **NixVim** - For declarative Neovim configuration
- **Catppuccin** - For beautiful theming
- **Kickstart.nvim** - For sensible defaults

## 📄 License

This configuration is provided as-is for educational and personal use.

---

<div align="center">

**⚡ Powered by NixVim • 🎨 Themed by Catppuccin • 🚀 Inspired by LazyVim**

*"Configuring Neovim, the Nix way"*

</div>