# This script is to demonstrate the shell.nix that uses 
# env.LD_LIBRARY_PATH to  manage python package libraries

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