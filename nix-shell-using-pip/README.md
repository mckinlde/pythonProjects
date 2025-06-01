# Sometimes, you just want to run some python.
Background: https://www.youtube.com/watch?v=6fftiTJ2vuQ

Use this to get a devshell where you can pip install, run .py files, and generally use python as you're used to in a .venv.

To try it out, cd into this folder: 
```bash
cd ~/micrograd/nix-shell-using-pip
```

run ./nix-shell-using-pip-demo.sh to test:
```bash
chmod +x ~/nix-shell-using-pip-demo.sh
./nix-shell-using-pip-demo.sh
```

use nix-shell to run python scripts:
(note: 'exit' to exit nix-shell)
```bash
nix-shell
python numpy-demo.py
exit
```

and enter the nix-shell to use python manually:
(note: ctrl+D to exit python in nix-shell)
```bash
nix-shell
python
```