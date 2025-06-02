# set default python_version to python3, but allow overrides
{ 
  description = "basic flake for python development";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {self, nixpkgs, ... }: let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
    # use the pip2nix command to generate python-packages.nix
    packageOverrides = pkgs.callPackage ./python-packages.nix {};
    python = pkgs.python3.override { inherit packageOverrides }
  in{
    devShells.x86_64-linux.default = pkgs.mkShell{
      packages = [
        (python.withPackages(p: [ p.requests ]))
      ];
    };
  };
}
