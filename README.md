# Using Python on NixOS

### The best way to do it is to use venv inside a shell.nix; where you can pip install, run .py files, and generally use python as you're used to in a .venv.

-

This project started with me wanting to follow Andrej Karpathy's ["Zero to Hero"](https://karpathy.ai/zero-to-hero.html) course, specifically the first class, ["micrograd"](https://www.youtube.com/watch?v=VMj-3S1tku0)

Immediately, I ran into the ancient religious war of package management.  While Andrej cleverly works around the problem with [Jupyter Notebooks](https://jupyter.org), my primary goal is not to document and demonstrate Andrej's work, but to use it to develop and [deploy](https://edolstra.github.io/pubs/nspfssd-lisa2004-final.pdf) software. ([full thesis](https://edolstra.github.io/pubs/phd-thesis.pdf))

By studying the gospel of [Vimjoyer](https://www.youtube.com/watch?v=6fftiTJ2vuQ), I eveantually concluded that the best way to manage python on nix is to use venv inside a shell.nix:
```bash
cd ~/python-in-nix-experiments
nix-shell
python -m venv ./venv
source ./venv/bin/activate
python -m pip install numpy
python numpy-demo.py
```
 to pip install, run .py files, and generally use python as you're used to in a .venv.

To try it out, use the shell.nix at project root:
```bash
cd ~/python-in-nix-experiments
nix-shell
python -m venv ./venv
source ./venv/bin/activate
python -m pip install numpy
python numpy-demo.py
```

or cd into this folder and run ./nix-shell-using-pip-demo.sh to test:

(note: the flag defaults to python3 if not specified)
```bash
cd ~/python-in-nix-experiments/using-python-without-relying-on-nix/nix-shell-using-pip
chmod +x nix-shell-using-pip-demo.sh
./nix-shell-using-pip-demo.sh python311
```

### Notes:
- You'll need to activate the venv every time you enter nix-shell
```bash
source ./venv/bin/activate
```
- You'll need the -m flag every time you pip install
```bash
python -m pip install numpy
```
- You'll be able to launch Python without venv, but you won't be able to use pip, and you won't have any of your modules
```bash
[dmei@nixos:~/python-in-nix-experiments/using-python-without-relying-on-nix/nix-shell-using-pip]$ ls
expected-output.txt          numpy-demo.py  shell.nix
nix-shell-using-pip-demo.sh  README.md      venv

[dmei@nixos:~/python-in-nix-experiments/using-python-without-relying-on-nix/nix-shell-using-pip]$ nix-shell

[nix-shell:~/python-in-nix-experiments/using-python-without-relying-on-nix/nix-shell-using-pip]$ python numpy-demo.py 
Traceback (most recent call last):
  File "/home/dmei/python-in-nix-experiments/using-python-without-relying-on-nix/nix-shell-using-pip/numpy-demo.py", line 1, in <module>
    import numpy as np
ModuleNotFoundError: No module named 'numpy'
```

### Prerequisites: 
- solid programming (Python), 
- general comfort with command line (errors),
- ability to give up on the [one true faith](https://nixos.org/).

Results:
- the ability to use python with venv; by using ~/.../nix-shell-using-pip's shell.nix:
```bash
nix-shell
source ./venv/bin/activate 
```
 to get a nix-shell where you can pip install, run .py files, and generally use python as you're used to in a .venv.

# =====
Notes from the precise moment I abandoned nix package management to do what works (venv in a nix-shell):

On further reflection, I think that not even Nix can fix python's pagake management hell.

At least I can reliably use venv, and if your python project uses venv, then I'll expect I can run it on NixOS.

run with:
~/using-python-without-relying-on-nix/nix-shell-using-pip/nix-shell-using-pip-demo.sh

README.md:
~/using-python-without-relying-on-nix/nix-shell-using-pip/README.md

# =====
Notes from when I thought I was gonna get nix package management working (it doesn't):

If you wanna skip to the good part, the nix-shell for python development with nix package management is in:

using-python-with-nix-dependency-management/nix-shell-with-pip2nix/shell.nix

It's best used with a ./requirements.txt file next to it in the TLD.  So your project dir starts like:

/project
- shell.nix
- requirements.txt

cd into /project, then run pip2nix with this command:

$ nix run github:nix-community/pip2nix -- generate -r ./requirements.txt

then launch the devshell
$ nix-shell

and finally run a python script
$ python numpy-demo.py


=====EOF