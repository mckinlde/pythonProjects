# set default python_version to python3, but allow overrides
{ 
  description = "basic flake for python development";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {self, nixpkgs, ... }: let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in{
    devShells.x86_64-linux.default = pkgs.mkShell{
      packages = [
        pkgs.python3
      ];

      env.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [ 
      # import libraries that your python packages depend on
      # these are the most common
      pkgs.stdenv.cc.cc.lib
      pkgs.libz
      ];
    };
  };
}
