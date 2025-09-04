{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser = {
        url = "github:0xc000022070/zen-browser-flake";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-unstable, zen-browser, ... }@inputs: let
    system = "x86_64-linux";
    unpkgs = import nixpkgs-unstable { inherit system; config.allowUnfree = true; };
  in {
    nixosConfigurations.noir = nixpkgs.lib.nixosSystem {
      system = system;
      specialArgs = { inherit unpkgs; inherit inputs; inherit system; };
      modules = [
          ./configuration.nix
      ];
    };
  };
}
