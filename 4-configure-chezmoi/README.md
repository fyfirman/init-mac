# Configure Chezmoi (Dotfiles)

This step sets up [chezmoi](https://www.chezmoi.io/) to manage your dotfiles from your GitHub repository.

## Prerequisites

- **Homebrew** installed (see `1-brew-apps/`)
- **Git** configured (see `6-configure-git/`)

## Installation

### Option 1: Using the setup script

```bash
chmod +x configure-chezmoi.sh
./configure-chezmoi.sh
```

### Option 2: Manual setup

1. **Install chezmoi** (if not already installed via Brewfile):
   ```bash
   brew install chezmoi
   ```

2. **Initialize and apply your dotfiles**:
   ```bash
   # For public repo
   chezmoi init --apply https://github.com/fyfirman/dotfiles.git

   # For private repo (uses SSH)
   chezmoi init --apply git@github.com:fyfirman/dotfiles.git
   ```

## What Chezmoi Does

- Clones your dotfiles repo to `~/.local/share/chezmoi`
- Applies configurations to your home directory
- Supports templates for machine-specific customization
- Tracks changes and allows easy updates

## Common Commands

```bash
# Apply dotfiles (after making changes in repo)
chezmoi apply

# Preview changes before applying
chezmoi diff

# Edit a dotfile in your repo
chezmoi edit ~/.zshrc

# Re-apply after pulling updates
chezmoi update
```

## Troubleshooting

- **Permission errors**: Ensure you have write access to `~` and `~/.config`
- **Private repo**: Use the SSH URL and ensure your SSH key is set up with GitHub
- **Conflicts**: Run `chezmoi diff` to see what would change before applying
