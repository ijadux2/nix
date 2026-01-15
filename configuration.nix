{ pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/libs.nix
    ./modules/time.nix
    ./modules/sys-pkgs.nix
    ./modules/services-programs.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "itachi"; # Define your hostname.

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # Force Electron apps (OpenCode) to use Wayland
    WLR_NO_HARDWARE_CURSORS = "1"; # Fixes disappearing cursor in Hyprland
  };
  nixpkgs.config.allowUnfree = true;
  users.users.jadu = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "jadu";
    extraGroups = [
      "networkmanager"
      "wheel"
      "adbusers"
    ];
  };
  system.stateVersion = "25.11";
}
