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
  };

  outputs = { nixpkgs, home-manager, nixvim, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.itachi = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        ./configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.jadu = {
            imports = [
              nixvim.homeModules.nixvim
              ./home/jadu.nix
            ];
          };
          
          home-manager.backupFileExtension = "backup";
        }
      ];
    };
  };
}

