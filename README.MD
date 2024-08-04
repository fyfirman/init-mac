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