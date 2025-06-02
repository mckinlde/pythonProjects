# Sometimes, you just want to run some python.
Background: https://www.youtube.com/watch?v=6fftiTJ2vuQ

Use this to get a devshell where you can pip install, run .py files, and generally use python as you're used to in a .venv.

To try it out, cd into this folder: 
```bash
cd ~/using-python-without-relying-on-nix/nix-shell-using-pip
```

run ./nix-shell-using-pip-demo.sh to test:
(note: can use flag for any python version, default to python3)
```bash
chmod +x ~/nix-shell-using-pip-demo.sh
./nix-shell-using-pip-demo.sh python311
```

use nix-shell to run python scripts:
(notes: 
- $ python -m venv ./venv # create devshell if you haven't already
- 'exit' to exit nix-shell)
```bash
nix-shell
source ./venv/bin/activate # Activate venv every time you nix-shell
python numpy-demo.py
exit
```

and enter the nix-shell to use python manually:
(note: ctrl+D to exit python in nix-shell)
```bash
nix-shell
source ./venv/bin/activate # Activate venv every time you nix-shell
# you'll be able to launch Python without venv, but you won't be able to use pip, and you won't have any of your modules
python
```