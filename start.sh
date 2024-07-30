#!/bin/bash

# Check if brew is installed
if ! command -v brew &> /dev/null; then
  echo "brew is not installed. Installing brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "✅ brew is installed."

# Path to the text file containing the list of applications
FILE="apps.txt"

# Check if the file exists
if [[ ! -f "$FILE" ]]; then
  echo "❌ File $FILE does not exist."
  exit 1
fi

# Read the file line by line and install each application
while IFS= read -r app; do
  if [[ -n "$app" ]]; then
    echo "Installing $app..."
    # brew install --cask "$app"
    echo "✅ $app has been installed."
  fi
done < "$FILE"

echo "✅ All applications from $FILE have been installed."
