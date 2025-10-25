# NVM Installation Guide

This guide covers the installation of zsh-nvm, a zsh plugin for Node Version Manager (nvm), which provides better performance and integration with zsh compared to the standard nvm installation.

## Why zsh-nvm?

- **Lazy loading** - Faster shell startup times
- **Better zsh integration** - Auto-completion and better performance
- **Automatic upgrades** - Built-in upgrade functionality
- **Auto .nvmrc detection** - Automatically switches Node versions based on .nvmrc files

---

## Installation

### Option 1: Manual Installation (Recommended)

1. Clone zsh-nvm to your zsh plugins directory:

```bash
git clone https://github.com/lukechilds/zsh-nvm ~/.zsh-nvm
```

2. Add to your `~/.zshrc`:

```bash
# Load zsh-nvm
source ~/.zsh-nvm/zsh-nvm.plugin.zsh
```

3. Reload your shell:

```bash
source ~/.zshrc
```

### Option 2: Using Oh My Zsh

1. Clone the repository into Oh My Zsh's custom plugins directory:

```bash
git clone https://github.com/lukechilds/zsh-nvm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm
```

2. Add `zsh-nvm` to your plugins in `~/.zshrc`:

```bash
plugins=(... zsh-nvm)
```

3. Reload your shell:

```bash
source ~/.zshrc
```

### Option 3: Using Zinit

Add to your `~/.zshrc`:

```bash
zinit light lukechilds/zsh-nvm
```

---

## Configuration

### Enable Auto .nvmrc Detection

Add this **before** loading zsh-nvm in your `~/.zshrc`:

```bash
# Automatically switch Node versions when .nvmrc is present
export NVM_AUTO_USE=true

# Load zsh-nvm
source ~/.zsh-nvm/zsh-nvm.plugin.zsh
```

### Additional Options

You can customize zsh-nvm behavior with these environment variables (set before loading the plugin):

```bash
# Lazy load nvm for faster shell startup (default: enabled)
export NVM_LAZY_LOAD=true

# Trigger lazy load on specific commands only
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('vim' 'nvim')

# Automatically update nvm on shell startup (checks once per day)
export NVM_AUTO_UPDATE=true

# Disable completion (if you want faster startup)
export NVM_NO_USE=true

# Directory where nvm is installed (default: ~/.nvm)
export NVM_DIR="$HOME/.nvm"
```

### Recommended Configuration

Add this to your `~/.zshrc`:

```bash
# zsh-nvm configuration
export NVM_AUTO_USE=true          # Auto-switch based on .nvmrc
export NVM_LAZY_LOAD=true         # Lazy load for faster startup
export NVM_AUTO_UPDATE=true       # Auto-update nvm

# Load zsh-nvm
source ~/.zsh-nvm/zsh-nvm.plugin.zsh
```

---

## Upgrading NVM

### Auto-upgrade

With `NVM_AUTO_UPDATE=true` set, nvm will automatically check for updates once per day.

### Manual upgrade

Run the upgrade command:

```bash
nvm upgrade
```

This will:
1. Download the latest version of nvm
2. Update nvm to the latest version
3. Preserve all installed Node versions

---

## Usage

### Install Node Versions

```bash
# Install the latest LTS version
nvm install --lts

# Install the latest version
nvm install node

# Install a specific version
nvm install 18.19.0
nvm install 20.10.0
```

### Switch Node Versions

```bash
# Use a specific version
nvm use 18

# Use LTS version
nvm use --lts

# Use system version (if installed via Homebrew)
nvm use system
```

### Set Default Version

```bash
# Set default Node version
nvm alias default 20

# Or use LTS as default
nvm alias default --lts
```

### List Installed Versions

```bash
# List installed versions
nvm ls

# List available versions
nvm ls-remote

# List available LTS versions
nvm ls-remote --lts
```

---

## Using .nvmrc Files

### Creating .nvmrc

In your project directory, create a `.nvmrc` file:

```bash
echo "20.10.0" > .nvmrc
```

Or use a version alias:

```bash
echo "lts/*" > .nvmrc
echo "node" > .nvmrc  # Latest version
```

### Auto-switching

With `NVM_AUTO_USE=true` enabled, nvm will automatically:
- Detect .nvmrc files when you `cd` into a directory
- Switch to the specified Node version
- Install the version if it's not already installed (with prompt)

Example workflow:

```bash
# Your .nvmrc contains "18.19.0"
cd ~/projects/my-project
# Automatically switches to Node 18.19.0

cd ~/projects/other-project
# .nvmrc contains "20.10.0", automatically switches to Node 20.10.0

cd ~/projects/no-nvmrc-project
# Uses your default Node version
```

---

## Verification

After installation, verify everything works:

```bash
# Check nvm is installed
nvm --version

# Check Node is installed
node --version

# Check npm is installed
npm --version

# Test auto-switching with .nvmrc
echo "18" > /tmp/test-nvmrc/.nvmrc
cd /tmp/test-nvmrc
# Should automatically switch to Node 18 or prompt to install
```

---

## Troubleshooting

### nvm command not found

1. Make sure zsh-nvm is loaded in your `~/.zshrc`
2. Reload your shell: `source ~/.zshrc`
3. Check if the plugin is installed: `ls ~/.zsh-nvm`

### Slow shell startup

If your shell is slow to start:

1. Make sure lazy loading is enabled:
   ```bash
   export NVM_LAZY_LOAD=true
   ```

2. Or defer loading until needed:
   ```bash
   export NVM_LAZY_LOAD=true
   export NVM_LAZY_LOAD_EXTRA_COMMANDS=('vim')
   ```

### Auto-switching not working

1. Verify `NVM_AUTO_USE=true` is set **before** loading zsh-nvm
2. Check your .nvmrc file contains a valid version
3. Reload your shell: `source ~/.zshrc`

### Permission errors

If you get permission errors:

```bash
# Fix nvm directory permissions
chmod -R 755 ~/.nvm
```

---

## Uninstallation

To remove zsh-nvm:

```bash
# Remove the plugin directory
rm -rf ~/.zsh-nvm

# Or for Oh My Zsh
rm -rf ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-nvm

# Remove from ~/.zshrc
# Delete the lines that load zsh-nvm

# Optional: Remove nvm and all Node versions
rm -rf ~/.nvm
```

---

## Additional Resources

- [zsh-nvm GitHub Repository](https://github.com/lukechilds/zsh-nvm)
- [nvm Official Documentation](https://github.com/nvm-sh/nvm)
- [Node.js Release Schedule](https://nodejs.org/en/about/releases/)

---

## Notes

- zsh-nvm will automatically install nvm if it's not already present
- The first time you use nvm, it will download and install Node.js
- With `NVM_AUTO_USE=true`, switching happens automatically when you `cd` into directories with .nvmrc files
- Using `nvm upgrade` keeps your nvm installation up to date with the latest features and bug fixes
- LTS (Long Term Support) versions are recommended for production use
- For better shell startup performance, keep `NVM_LAZY_LOAD=true` enabled

