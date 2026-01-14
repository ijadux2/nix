# 🏰 NixOS Configuration

<div align="center">

![NixOS](https://img.shields.io/badge/NixOS-5277C3?style=for-the-badge&logo=nixos&logoColor=white)
![Home Manager](https://img.shields.io/badge/Home%20Manager-FF6C00?style=for-the-badge&logo=home-manager&logoColor=white)
![NixVim](https://img.shields.io/badge/NixVim-57A143?style=for-the-badge&logo=vim&logoColor=white)
![Flakes](https://img.shields.io/badge/Flakes-7E7EFF?style=for-the-badge&logo=nix&logoColor=white)

_A declarative, reproducible, and beautifully configured NixOS setup with Home Manager and NixVim integration._

</div>

## ✨ Features

### 🖥️ System Configuration

- **NixOS Unstable** with experimental features enabled
- **Flakes-based** setup for reproducibility
- **Home Manager** integration for user-level configuration
- **NixVim** for Neovim configuration in Nix
- **Zsh** shell with Oh My Zsh and extensive aliases
- **Hyprland** window manager (if configured)

### 🛠️ Development Environment

- **Multi-language support**: Nix, Python, TypeScript/JavaScript, Lua, C/C++, Shell, Web
- **LSP servers** configured for intelligent code completion
- **Formatters** for consistent code style
- **Linters** for code quality assurance
- **Git** integration with useful aliases
- **Android development** tools
- **React Native** development environment

### 🎨 User Experience

- **Catppuccin** theme system-wide
- **Nerd Fonts** for beautiful terminal rendering
- **Modern CLI tools**: `eza`, `ripgrep`, `bat`, `btop`
- **File management**: `yazi`, `thunar` with plugins
- **Clipboard management**: `cliphist`
- **Screenshot tools**: `grim`, `slurp`

## 📁 Project Structure

```
nix/
├── 📄 flake.nix                 # Main flake configuration
├── 📄 configuration.nix         # System configuration
├── 📄 hardware-configuration.nix # Hardware-specific settings
├── 📁 modules/                   # System modules
│   ├── 📄 libs.nix              # System libraries
│   ├── 📄 services-programs.nix # Services and programs
│   ├── 📄 sys-pkgs.nix          # System packages
│   └── 📄 time.nix              # Time and timezone settings
└── 📁 home/                     # Home Manager configuration
    ├── 📄 home.nix              # Basic home configuration
    ├── 📄 jadu.nix              # User-specific configuration
    ├── 📄 pkgs.nix              # User packages
    └── 📁 nix/                  # NixVim configuration
        ├── 📄 plugins.nix       # Vim plugins
        ├── 📄 cmp.nix           # Completion configuration
        ├── 📄 custom.nix        # Custom Vim settings
        └── 📄 keybind.nix       # Key bindings
```

## 🚀 Quick Start

### Prerequisites

- NixOS with Flakes enabled
- Basic understanding of Nix configuration

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/ijadux2/nix.git
   cd ~/nix
   ```

2. **Update the system:**

   ```bash
   sudo nixos-rebuild switch --flake .#itachi
   ```

3. **Update Home Manager:**
   ```bash
   home-manager switch --flake .#jadu
   ```

### Useful Commands

| Command                                      | Description                       |
| -------------------------------------------- | --------------------------------- |
| `sudo nixos-rebuild switch --flake .#itachi` | Rebuild system configuration      |
| `home-manager switch`                        | Update Home Manager configuration |
| `sudo nix-collect-garbage -d`                | Clean up old generations          |
| `nix flake update`                           | Update flake inputs               |

## ⚙️ Configuration Details

### System Packages

The system includes essential packages for:

- **Development**: `git`, `curl`, `wget`, `cmake`, `ninja`
- **Desktop Environment**: `kitty`, `waybar`, `hyprlock`
- **Multimedia**: `mpv`, `chromium`, `brave`
- **Android Development**: `android-tools`, `jdk17`
- **React Native**: `nodejs_24`, `watchman`

### User Packages

Home Manager provides:

- **Development Tools**: `vscodium`, `flutter`, `gh`
- **CLI Enhancements**: `eza`, `ripgrep`, `bat`, `btop`
- **File Management**: `yazi`, `thunar` with plugins
- **Formatters & Linters**: `nixfmt`, `black`, `prettier`, `eslint`
- **Rust Development**: `rustc`, `cargo`, `rust-analyzer`

### Shell Configuration

Zsh is configured with:

- **Oh My Zsh** with `git` and `sudo` plugins
- **Extensive aliases** for productivity
- **Autosuggestions** and **syntax highlighting**
- **Zoxide** for smart directory navigation

### Key Aliases

```bash
# File operations
ll="ls -l"           # Detailed listing
lt="eza --tree"      # Tree view
y="yazi"             # File manager

# Development
v="nvim"             # Open Neovim
code="opencode"      # Open VS Code
gi="git add ."       # Stage all changes
gc="git commit -m"   # Commit with message
gs="git status"      # Git status

# System management
update="home-manager switch"           # Update Home Manager
rebuild="sudo nixos-rebuild switch"    # Rebuild NixOS
clean="sudo nix-collect-garbage -d"    # Clean up
```

## 🎯 NixVim Configuration

The Neovim setup includes:

### 🌟 Core Features

- **Catppuccin** color scheme
- **LSP** support for multiple languages
- **Treesitter** for syntax highlighting
- **Telescope** for fuzzy finding
- **Git integration** with Gitsigns

### 📦 Language Support

- **Nix**: `nil_ls` with `nixfmt`
- **Python**: `pyright` with `black` and `isort`
- **TypeScript/JavaScript**: `ts_ls` with `prettier`
- **Lua**: `lua_ls` with `stylua`
- **C/C++**: `clangd` with `clang-format`
- **Shell**: `bashls` with `shfmt`
- **Web**: `cssls`, `jsonls`, `html`

### 🔧 Editor Features

- **Auto-completion** with NVI-CMP
- **Auto-pairs** for brackets
- **Color highlighting** in code
- **Todo comments** tracking
- **Trouble** for diagnostics
- **DAP** for debugging

## 🎨 Theming

The configuration uses **Catppuccin Mocha** as the primary theme:

- System-wide Catppuccin integration
- Matching GTK theme
- Consistent color palette across applications
- Beautiful wallpapers from NixOS artwork

## 🔧 Customization

### Adding New Packages

1. **System packages**: Edit `modules/sys-pkgs.nix`
2. **User packages**: Edit `home/pkgs.nix`

### Adding New LSP Servers

Edit `home/jadu.nix` in the `plugins.lsp.servers` section:

```nix
your_language = {
  enable = true;
  settings = {
    # Your language server settings
  };
};
```

### Adding New Vim Plugins

Edit `home/nix/plugins.nix`:

```nix
your_plugin.enable = true;
```

## 🤝 Contributing

Feel free to:

- 🐛 Report issues
- 💡 Suggest improvements
- 📝 Submit pull requests
- 🌟 Star the repository

## 📄 License

This configuration is provided as-is for educational and personal use.

## 🙏 Acknowledgments

- **NixOS** community for the amazing declarative system
- **Home Manager** for user-level configuration management
- **NixVim** for Neovim in Nix
- **Catppuccin** for the beautiful color scheme
- **LazyVim** for inspiration on modern Neovim configuration

---

<div align="center">

**Made with ❤️ using Nix**

_"In Nix we trust"_

</div>

