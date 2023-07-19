#!/bin/bash

# Check if the "dojoup" package is installed
if [ -x "$(command -v dojoup)" ]; then
    echo "dojoup is already installed."
else
    echo "Installing dojoup..."
    curl -L https://install.dojoengine.org | bash
fi

# Deploy the contract using sozo migrate command
if [ -x "$(command -v sozo)" ]; then
    echo "Deploying contract using sozo migrate..."
    sozo migrate
else
    echo "sozo command not found. Make sure 'sozo' is installed and added to the system PATH."
fi
