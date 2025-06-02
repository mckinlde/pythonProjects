Congratulations, this is the one you want.

It runs python with a shell.nix, takes the python version as a parameter, and generates nixpkgs with pip2nix.

It's best used with a ./requirements.txt file next to it in the TLD.  So your project dir starts like:

/project
- shell.nix
- requirements.txt
- numpy-demo.py
- nix-shell-setup.sh

If you run nis-shell-setup.sh, it basically does the following, except there's some comments about other pip2nix tricks:

$ nix run github:nix-community/pip2nix -- generate -r ./requirements.txt

then launch the devshell
$ nix-shell

and finally run a python script
$ python numpy-demo.py