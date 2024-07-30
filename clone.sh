#!/bin/bash

# Path to the text file containing the list of repositories
repo_list="repositories.txt"


# Make the directory if it doesn't exist
mkdir -p ~/code/fyfirman
cd ~/code/fyfirman

# Loop through each repository in the file and clone it
while IFS= read -r repo_url; do
  git clone "$repo_url"
done < "$repo_list"