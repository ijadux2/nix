{config, libs, pkgs, ... }:

{
  programs.nix-ld.libraries = with pkgs; [
  stdenv.cc.cc
  glibc
  zlib
  openssl
  libgcc
  xorg.libX11
  xorg.libXcursor
  xorg.libXrandr
  xorg.libXinerama
  xorg.libXi
  xorg.libXcomposite
  xorg.libXdamage
  xorg.libXfixes
  alsa-lib
  atk
  cairo
  pango
  gtk3
  nss
  nspr
 ];
}
