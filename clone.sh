#!/bin/bash

echo "🚀 Current directory: $(pwd)"
echo "📄 File path provided: $1"

# Check if a file name is provided as an argument
if [ -z "$1" ]; then
  echo "❌ Usage: $0 <file_with_repo_links>"
  exit 1
fi

# Capture the full path to the file
REPO_FILE="$(realpath "$1")"

# Check if the file exists
if [ ! -f "$REPO_FILE" ]; then
  echo "❌ Error: File '$REPO_FILE' not found!"
  exit 1
fi

# Define the target directory
TARGET_DIR=~/code/fyfirman

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Change to the target directory
cd "$TARGET_DIR" || exit

# Read each line from the file and clone the repository
while IFS= read -r repo_url; do
  if [ ! -z "$repo_url" ]; then
    # Extract the repository name from the URL
    repo_name=$(basename -s .git "$repo_url")

    # Check if the directory already exists
    if [ -d "$repo_name" ]; then
      echo "🔄 Skipping $repo_url: directory '$repo_name' already exists"
    else
      echo "🔄 Cloning $repo_url into $TARGET_DIR"
      git clone "$repo_url" || echo "❌ Failed to clone $repo_url"
    fi
  else
    echo "🔄 Skipping empty line"
  fi
done < "$REPO_FILE"
