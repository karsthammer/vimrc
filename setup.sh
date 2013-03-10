#!/bin/bash

echo "Setting up your vim settings"
cd $(dirname "$0")

echo "Installing Vundler"
git submodule init
git submodule update

echo "Installing bundles"
vim -s .bundle_install 2>/dev/null

cd - > /dev/null
echo "Finished setting up vim"
