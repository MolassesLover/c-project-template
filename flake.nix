{
  description =
    "An embeddable and easy to integrate runtime for RPG games.";

  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; };

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" ];

      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in {
      packages = forAllSystems (system:
        let
          pkgs = (import nixpkgs { inherit system; });
          program = pkgs.callPackage misc/nix/package.nix { };
        in {
          inherit program;
          default = program;
          devShell = pkgs.mkShell { inputsFrom = [ program ]; };
        });
    };
}
