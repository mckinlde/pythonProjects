# before using the nix shell, we need to generate any missing packages

# call pip2nix to generate a package from a pypi package
#nix run github:nix-community/pip2nix -- generate requests

# or, more commonly, call pip2nix to generate packages from requirements.txt
nix run github:nix-community/pip2nix -- ./requirements.txt

# A cool example with a nix-shell
#nix shell github:nix-community/pip2nix
#pip2nix generate "requests==2.32" numpy

# you will get a file called python-packages.nix which will have the package 
# overrides that you're expecting in shell.nix

# once python-packages.nix is generated, we can launch our shell

python_version=${1:-python3}  # Use first CLI arg, or default to python3

echo "1) activate nix shell with $python_version..."
nix-shell --argstr python_version "$python_version" --run '
    echo "2) create virtualenv..."
    python -m venv ./venv
    echo "3) activate virtualenv..."
    source ./venv/bin/activate
    echo "4) use pip to install numpy..."
    python -m pip install numpy
    echo "5) run numpy demo..."
    python numpy-demo.py
'