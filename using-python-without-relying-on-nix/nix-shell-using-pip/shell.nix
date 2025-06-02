# set default python_version to python3, but allow overrides
{ pkgs ? import <nixpkgs> {}, python_version ? "python3" }:

pkgs.mkShell {  
  packages = [
    pkgs.${python_version}
  ];

  env.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [ 
  # import libraries that your python packages depend on
  # these are the most common
   pkgs.stdenv.cc.cc.lib
   pkgs.libz
  ];
  
}
