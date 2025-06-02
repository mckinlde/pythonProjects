This method doesn't use a requirements.txt, it just has an array of packages.

To add a package, add it to the array in shell.nix

=============================================

If a pypi package that you need isn't in nixpkgs, you'll have to package it yourself.

The best way to do that is with the (pip2nix)[https://github.com/nix-community/pip2nix] command

And that command is best used with a /requirements.txt
