{ config, pkgs, ... }:

{
  services.displayManager.ly.enable = true;
  services.xserver.enable = true;
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable awesome-wm window manager
  services.xserver.windowManager.awesome = {
    enable = true;
    luaModules = with pkgs.luaPackages; [
      lgi
    ];
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  programs = {
    zsh.enable = true;
    hyprland.enable = true;
    nix-ld.enable = true;
    thunar.enable = true;
  };

  services = {
    gvfs.enable = true;
    tumbler.enable = true;
    udisks2.enable = true;
    libinput.enable = true;
    blueman.enable = true;
    flatpak.enable = true;
    power-profiles-daemon.enable = true;
    upower.enable = true;
  };

  services.ollama = {
    enable = true;
    package = pkgs.ollama-vulkan;
  };

  services.open-webui = {
    enable = true;
    port = 8080;
  };

  # Enable networking for Noctalia
  networking.networkmanager.enable = true;

}
