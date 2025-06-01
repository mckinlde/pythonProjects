This project started with me wanting to follow Andrej Karpathy's ["Zero to Hero"](https://karpathy.ai/zero-to-hero.html) course, specifically the first class, ["micrograd"](https://www.youtube.com/watch?v=VMj-3S1tku0)

Immediately, I ran into the ancient religious war of package management.  While Andrej cleverly works around the problem with [Jupyter Notebooks](https://jupyter.org), my primary goal is not to document and demonstrate Andrej's work, but to use it to develop and [deploy](https://edolstra.github.io/pubs/nspfssd-lisa2004-final.pdf) software. ([full thesis](https://edolstra.github.io/pubs/phd-thesis.pdf))

By studying the gospel of [Vimjoyer](https://www.youtube.com/watch?v=6fftiTJ2vuQ), I hope to develop a reproducible flake.nix for developing Neural Networks with Python on Nix.

Prerequisites: 
- solid programming (Python), 
- intro-level math (e.g. derivative, gaussian), 
- the one true faith: [NixOS](https://nixos.org/).

Results:
- the ability to use /nix-shell-using-pip's shell.nix to get a nix-shell where you can pip install, run .py files, and generally use python as you're used to in a .venv.