# Git Configuration Guide

This directory contains a simple script to configure Git with your name and email.

## Quick Start

```bash
# Make the script executable and run it
chmod +x configure-git.sh
./configure-git.sh
```

The script will prompt you for:
- Your full name
- Your email address

## What the Script Does

The script configures:
- **User Identity**: Sets your name and email for Git commits
- **Basic Settings**: Default branch, push behavior, credential helper
- **Line Endings**: Proper handling for macOS
- **Useful Aliases**: Common Git shortcuts

## Manual Configuration

If you prefer to configure Git manually:

```bash
# Set your name and email
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"

# Set default branch
git config --global init.defaultBranch main

# Set credential helper for macOS
git config --global credential.helper osxkeychain
```

## Verification

After running the script, verify your configuration:

```bash
git config --list
```

## Next Steps

After configuring Git, you can proceed with:
1. **Configure chezmoi** (see `4-configure-chezmoi/`)
2. **macOS configuration** (see `5-configuring-macos/`)