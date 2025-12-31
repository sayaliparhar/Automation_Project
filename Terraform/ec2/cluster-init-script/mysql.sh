#!/bin/bash

echo "Updating system..."
sudo apt update -y

echo "Installing MySQL Client..."
# This installs just the command-line tools
sudo apt install -y mysql-client

# Verify installation
if command -v mysql &> /dev/null; then
    echo "MySQL Client installed successfully!"
    mysql --version
else
    echo "Installation failed."
    exit 1
fi