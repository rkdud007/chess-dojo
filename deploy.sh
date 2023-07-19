#!/bin/bash

# Check if the "dojoup" package is installed
# Check directory for dojoup is exist
DOJO_DIR="./dojo"
if [ -x "$(command -v $DOJO_DIR/bin/dojoup)" ]; then
    echo "dojoup is already installed."
else
    echo "Installing dojoup..."
    # install it in a specific directory
    curl -L https://install.dojoengine.org | DOJO_DIR=$DOJO_DIR bash
    $DOJO_DIR/bin/dojoup 
fi

which_path="$(which sozo)"
echo $which_path

# Deploy the contract using sozo migrate command
if [ -x "$(command -v $which_path)" ]; then
    echo "Deploying contract using sozo migrate..."
    $which_path migrate
else
    echo "sozo command not found. Make sure 'sozo' is installed and added to the system PATH."
fi
