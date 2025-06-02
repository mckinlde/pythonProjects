Now let's use python with Nix's package manager instead of Python's (many) package managers.

use the (pip2nix)[https://github.com/nix-community/pip2nix] command to generate python-packages.nix

Note: this is by far best done with a requirements.txt file in place.  
If you're onboarding to someone else's python project, get their requirements.txt and run the ...-setup.sh