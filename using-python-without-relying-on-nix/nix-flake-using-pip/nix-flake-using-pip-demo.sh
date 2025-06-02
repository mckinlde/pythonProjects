# This script is to demonstrate the flake.nix that uses 
# env.LD_LIBRARY_PATH to  manage python package libraries

echo "1) Entering nix develop shell ..."

nix develop --command bash <<EOF
  set -euo pipefail

  echo "2) Creating virtualenv..."
  python3 -m venv ./venv

  echo "3) Activating virtualenv..."
  source ./venv/bin/activate

  echo "4) Installing numpy..."
  python -m pip install numpy

  echo "5) Running demo..."
  python numpy-demo.py
EOF
