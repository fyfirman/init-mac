#!/bin/bash

# URL to the repo.txt file in your GitHub repository
REPO_LIST_URL="https://raw.githubusercontent.com/fyfirman/init-mac/main/repo.txt"

echo "🚀 Current directory: $(pwd)"

# Define the target directory
TARGET_DIR=~/code/fyfirman

# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Change to the target directory
cd "$TARGET_DIR" || exit

# Download the repo.txt file to a temporary location
TEMP_REPO_FILE=$(mktemp)
echo "📥 Downloading repository list to $TEMP_REPO_FILE..."
curl -s -o "$TEMP_REPO_FILE" "$REPO_LIST_URL" || { echo "❌ Failed to download repo list"; exit 1; }

# Read each line from the temporary file and clone the repository
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
done < "$TEMP_REPO_FILE"

# Clean up the temporary file
rm "$TEMP_REPO_FILE"
echo "🧹 Temporary file removed"
