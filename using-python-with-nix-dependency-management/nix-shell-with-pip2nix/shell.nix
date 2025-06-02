# set default python_version to python3, but allow overrides
{ pkgs ? import <nixpkgs> {}, python_version ? "python3" }:

let # use the pip2nix command to generate python-packages.nix
  packageOverrides = pkgs.callPackage ./python-packages.nix {};
  python = pkgs.${python_version}.override { inherit packageOverrides; };
in
pkgs.mkShell {  
  packages = [
    # use python.withPackages to extend the env of python
    # to include any packages we may need fron nixPackages
    # @Param: python
    # @Return: array of packages it needs
    pkgs.${python_version}.withPackages(pypkgs: [ pypkgs.requests ])
  ];
  # Notice!  We aren't worried about dependencies, libraries, or venv!
}
