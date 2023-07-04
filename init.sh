#!/bin/bash
PACKAGE=$1
# Clone course repository
REPO_URL="https://github.com/InseeFrLab/appariement.git"
CLONE_DIR="/home/onyxia/work/appariement"
git clone --depth 1 $REPO_URL $CLONE_DIR
cd $CLONE_DIR

#!/bin/bash

# Install required packages depending on the language used (R or Python)
if [[ $PACKAGE == "reclin2" ]]; then
    # Define the path to the package list file
    package_file="requirements_R.txt"  # Replace with the path to your package list file

    # Read the package names from the file and install them
    while read -r package_to_install; do
        Rscript -e "if (!requireNamespace('$package_to_install', quietly = TRUE)) install.packages('$package_to_install')"
    done < "$package_file"
else
    pip install -r requirements_Python.txt
fi

# Open the relevant notebook when starting Jupyter Lab
jupyter server --generate-config
sudo chown -R ${USERNAME}:${GROUPNAME} ${HOME}
echo "c.LabApp.default_url = '/lab/tree/appariement/examples/tuto_$PACKAGE.ipynb'" >> /home/onyxia/.jupyter/jupyter_server_config.py