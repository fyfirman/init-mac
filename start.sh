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
    echo "-- Installing $app..."
    if brew install --cask "$app" 2>&1 | tee -a error.log; then
      echo "-- ✅ $app has been installed."
    else
      echo "-- ❌ Failed to install $app."
      errors+=("$app")
    fi
  fi
done < "$FILE"

echo "✅ All applications from $FILE have been installed."

# Print the list of applications that failed to install
if [[ ${#errors[@]} -gt 0 ]]; then
  echo "❌ The following applications failed to install:"
  for error in "${errors[@]}"; do
    echo "-- $error"
  done
fi