# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Repository Overview

This is a macOS initialization and setup automation repository. It automates:
1. Installing Homebrew packages and applications via Brewfile
2. Cloning personal repositories from a centralized list
3. Configuring development environment for full-stack development

The repository is designed to be executed remotely without local cloning, enabling quick setup on new machines.

## Common Commands

### Homebrew Package Management

```bash
# Install all packages from Brewfile
brew bundle install --file=1-brew-apps/Brewfile

# Update Brewfile with currently installed packages
brew bundle dump --file=1-brew-apps/Brewfile --force

# Update all packages
brew update && brew upgrade && brew upgrade --cask && brew cleanup
```

### Repository Cloning

```bash
# Execute clone script directly from GitHub (recommended method)
bash <(curl -s https://raw.githubusercontent.com/fyfirman/init-mac/main/clone.sh)

# Or locally
./clone.sh
```

### Post-Installation Setup

```bash
# Java (OpenJDK 11)
echo 'export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"' >> ~/.zshrc

# Python (pyenv)
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc

# SQL Server tools
echo 'export PATH="/opt/homebrew/opt/mssql-tools18/bin:$PATH"' >> ~/.zshrc

# FZF shell integration
$(brew --prefix)/opt/fzf/install

# Flutter version management
fvm install stable && fvm global stable
```

## Architecture

### Script Structure

**`clone.sh`**: Self-contained repository cloning automation
- Downloads `repo.txt` from GitHub at runtime
- Clones repositories to `~/code/fyfirman`
- Skips existing directories
- Designed for remote execution without local repo

**`1-brew-apps/Brewfile`**: Declarative package manifest
- Custom taps for specialized tools (sshpass, FVM, SQL Server)
- ~52 total packages across CLI tools and GUI apps
- Focus areas: cloud infrastructure (AWS/GCP/K8s), databases (SQL Server), mobile (Flutter/Android), networking

**`repo.txt`**: Git repository list
- SSH URLs for personal projects
- One repository per line
- Dynamically fetched by `clone.sh`

**`configuration/`**: Static configuration assets
- Currently contains Rectangle window manager configuration screenshot

### Key Design Patterns

1. **Remote-First Execution**: Scripts designed to run via `curl | bash` without cloning
2. **Idempotency**: Scripts check for existing installations/clones before proceeding
3. **Target Directory Convention**: All repositories clone to `~/code/fyfirman`
4. **Brewfile as Source of Truth**: Use `brew bundle dump` to sync installed packages back to repo

## Repository Maintenance

### Adding New Applications

Edit `1-brew-apps/Brewfile` directly:
```bash
# For CLI tools
brew "package-name"

# For GUI applications
cask "app-name"

# For custom taps
tap "username/repo"
brew "username/repo/package"
```

### Adding Repositories to Clone List

Edit `repo.txt` with SSH URLs:
```
git@github.com:username/repo.git
```

### Applications Not in Homebrew

The following apps require manual installation (listed in README.MD):
- Bandwidth+ (Mac App Store)
- Homerow (GitHub release)
- Shottr (direct download)

## Environment Context

- **Target OS**: macOS (Apple Silicon/Intel compatible)
- **Shell**: zsh (macOS default)
- **Package Manager**: Homebrew
- **Directory Structure**: `~/code/fyfirman` for repositories
- **Remote Access**: Scripts hosted at `https://raw.githubusercontent.com/fyfirman/init-mac/main/`
