{
  description = "NixOS with Home Manager and NixVim";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      nixvim,
      quickshell,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.itachi = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };

            home-manager.users.jadu =
              { inputs, pkgs, ... }:
              {
                imports = [
                  nixvim.homeModules.nixvim
                  ./home/jadu.nix
                ];

                home.packages = [ inputs.quickshell.packages.${system}.default ];
              };

            home-manager.backupFileExtension = "backup";
          }
        ];
      };
    };
}
