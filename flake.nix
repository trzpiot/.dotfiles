{
  description = "trzpiot's dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    let
      lib = inputs.snowfall-lib.mkLib {
        inherit inputs;
        src = ./.;

        snowfall = {
          meta = {
            name = "trzpiot";
            title = "trzpiot's dotfiles";
          };

          namespace = "trzpiot";
        };
      };
    in
    lib.mkFlake {
      channels-config = {
        allowUnfree = true;
      };

      overlays = [
        inputs.nur.overlays.default
      ];

      systems.modules.nixos = [
        inputs.home-manager.nixosModules.home-manager
      ];
    };
}
