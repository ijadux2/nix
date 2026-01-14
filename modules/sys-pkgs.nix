{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome-keyring
    vim
    xdg-utils
    wget
    neovim
    brave
    chromium
    kitty
    waybar
    swww
    git
    curl
    love
    zsh
    nushell
    yazi
    opencode
    cliphist
    fuzzel
    grim
    wl-clipboard
    slurp
    hyprlock
    xdg-desktop-portal-hyprland
    mesa
    libgcc
    fontconfig
    hyprpolkitagent
    wayland-utils
    wlr-protocols
    cmake
    meson
    ninja
    pkg-config
    hyprutils
    nerd-fonts.jetbrains-mono
    nwg-look
    matugen
    wallust
    coreutils-full
    progress
    binutils
    libgcc
    libtool

    # Bluetooth tools
    blueman
    bluez
    pulseaudio

    # Android development system packages
    android-tools
    jdk17

    # React Native development
    nodejs_24
    nodePackages.npm
    watchman
  ];
}
