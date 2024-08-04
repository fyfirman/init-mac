# Brew Installer Script

This project contains a script to automate the installation of applications using Homebrew on macOS.

## Files

- `start.sh`: The main script that checks for Homebrew, installs it if necessary, and then installs a list of applications.
- `apps.txt`: A text file containing the list of applications to be installed.

## Usage

1. **Ensure you have the necessary permissions**:
   Make sure you have the necessary permissions to execute the script. You may need to run the script with `sudo`.

2. **Edit `apps.txt`**:
   Add the names of the applications you want to install to the `apps.txt` file. Each application should be on a new line.

   Example `apps.txt`:
   ```txt
   google-chrome
   visual-studio-code
   ```

## List apps that does not exist in cask

1. [Bandwidth+](https://apps.apple.com/us/app/bandwidth/id490461369?mt=12)
2. [Homerow](https://github.com/dexterleng/homerow) - Vimium for MacOS
3. [Shottr](https://shottr.cc/)

---

# `clone.sh` Script Documentation

## Overview

The `clone.sh` script automates the process of cloning repositories listed in a `repo.txt` file. The script downloads `repo.txt` from a specified URL, clones the repositories into a designated directory, and then cleans up the temporary file. This setup allows you to manage repositories remotely and execute the script without needing to clone the repository locally.

## Features

- Downloads `repo.txt` from a specified URL.
- Clones each repository listed in `repo.txt` into a target directory.
- Skips cloning if the repository's directory already exists.
- Cleans up the temporary `repo.txt` file after execution.
- Provides status updates and error messages with emojis for better visibility.

## Prerequisites

- `curl` or `wget` for downloading files.
- `git` for cloning repositories.
- A Unix-like environment (Linux, macOS, etc.).

## Script Installation

1. **Host the Script and `repo.txt` on GitHub**

   Upload the `clone.sh` script and `repo.txt` file to a GitHub repository. For example, use the following URLs:
   - Script URL: `https://raw.githubusercontent.com/fyfirman/init-mac/main/clone.sh`
   - `repo.txt` URL: `https://raw.githubusercontent.com/fyfirman/init-mac/main/repo.txt`

2. **Set Up the Target Directory**

   Ensure the target directory (`~/code/fyfirman`) exists or will be created by the script.

## Usage

You can execute the script directly from GitHub using a one-liner command. This command downloads and runs the script without needing to clone the repository.

### Execute the Script

#### Using `curl`

```bash
bash <(curl -s https://raw.githubusercontent.com/fyfirman/init-mac/main/clone.sh)
```

#### Using `wget`

```bash
bash <(wget -qO- https://raw.githubusercontent.com/fyfirman/init-mac/main/clone.sh)
```

## Notes

- Ensure the `repo.txt` file is correctly formatted and hosted on GitHub.
- The script assumes the use of a Unix-like shell environment.

## Troubleshooting

- **"File Not Found" Errors:** Verify that the `repo.txt` URL is correct and accessible.
- **"Permission Denied" Errors:** Check the permissions for the target directory and script.

## Contact

For further assistance, please contact [your email] or open an issue on the [GitHub repository](https://github.com/fyfirman/init-mac/issues).

---

This documentation provides a clear guide on how to use the `clone.sh` script, set up your environment, and troubleshoot common issues. Let me know if you need any additional information or adjustments!