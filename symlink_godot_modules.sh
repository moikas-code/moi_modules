#!/bin/bash

# Dynamically get the directory where the script is located
TARGET_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# The link name to be created in the Godot project directory
LINK_NAME="moi_modules"

# Check if the first argument is not empty
if [ -z "$1" ]; then
  echo "Usage: $0 <path_to_godot_project_directory>"
  exit 1
fi

# Create the symbolic link
ln -s "$TARGET_DIR" "$1/$LINK_NAME"

echo "Symbolic link created at $1/$LINK_NAME"
