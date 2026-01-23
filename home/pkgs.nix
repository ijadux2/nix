{ pkgs, ... }:
{

  home.packages = with pkgs; [
    feh
    zls
    go
    tuios
    brightnessctl
    tty-clock
    clock-rs
    nautilus
    glibc
    python313
    python313Packages.pyqt5
    python313Packages.pip
    fzf
    glibmm
    fish
    dunst
    cool-retro-term
    libblake3
    ghostty
    pipes-rs
    gtk3
    gtk4
    webkitgtk_4_1
    gh
    flutter
    git
    curl
    xz
    zip
    unzip
    clang
    cmake
    ninja
    pkg-config
    powershell
    libGL
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXinerama
    xorg.libXi
    xorg.libXcomposite
    xorg.libXdamage
    xorg.libXfixes
    xorg.libXext
    xorg.libXrender
    xorg.libXtst
    vscodium
    busybox
    bc
    imagemagick
    chromium
    gtk3
    gdk-pixbuf
    pango
    cairo
    atk
    glib
    freetype
    fontconfig
    dbus
    starship
    lua
    luajitPackages.lua-lsp
    emmylua-ls
    zoxide
    zsh-autosuggestions
    zsh-syntax-highlighting
    eza
    gnome-tweaks
    gnomeExtensions.dock-from-dash
    ripgrep
    nodejs
    nix-ld
    fastfetch
    nitch
    cmatrix
    glow
    gum
    waybar
    swaynotificationcenter
    # Create symlink for Google Chrome (Flutter needs this)
    (pkgs.writeShellScriptBin "google-chrome" ''
      exec ${pkgs.chromium}/bin/chromium "$@"
    '')
    nodePackages.vscode-langservers-extracted
    clang-tools
    nodePackages.bash-language-server
    nodePackages.vim-language-server

    # Formatters
    nixfmt
    black
    isort
    nodePackages.prettier
    stylua
    shfmt
    rustfmt
    go
    clang-tools

    # Linters
    pylint
    nodePackages.eslint
    shellcheck
    statix
    file
    thunar
    thunar-archive-plugin
    thunar-media-tags-plugin
    thunar-volman
    thunar-vcs-plugin
    thunar-dropbox-plugin
    btop
    bat
    rustc
    rust-analyzer
    cargo
    catppuccin
    catppuccin-gtk
    nixos-artwork.wallpapers.catppuccin-mocha
    catppuccinifier-gui
    catppuccin-grub
    yt-dlp
    video-downloader
    mpv-handler

    # Awesome-wm related packages
    rofi
    picom
    cliphist
  ];

}
