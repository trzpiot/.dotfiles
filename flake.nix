{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
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
        permittedInsecurePackages = [
          # TODO: Remove as soon as Logseq has updated the Electron version
          "electron-25.9.0"
        ];
      };

      overlays = [
        inputs.nur.overlay
      ];

      systems.modules.nixos = [
        inputs.home-manager.nixosModules.home-manager
      ];
    };
}
