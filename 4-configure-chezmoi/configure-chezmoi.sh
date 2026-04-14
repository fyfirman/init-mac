#!/bin/bash
set -e

DOTFILES_REPO="https://github.com/fyfirman/dotfiles.git"
DOTFILES_REPO_SSH="git@github.com:fyfirman/dotfiles.git"

echo "🔧 Configuring chezmoi with dotfiles from fyfirman/dotfiles"
echo ""

# Check if chezmoi is installed
if ! command -v chezmoi &> /dev/null; then
    echo "📦 Installing chezmoi via Homebrew..."
    brew install chezmoi
else
    echo "✅ chezmoi is already installed"
fi

# Check if chezmoi is already initialized
if [ -d "$HOME/.local/share/chezmoi" ]; then
    echo ""
    echo "⚠️  Chezmoi is already initialized."
    echo "   Run 'chezmoi update' to pull and apply latest changes."
    exit 0
fi

echo ""
echo "📥 Initializing chezmoi and applying dotfiles..."
echo "   (Using HTTPS - use SSH URL in README if repo is private)"
echo ""

chezmoi init --apply "$DOTFILES_REPO" || chezmoi init --apply "$DOTFILES_REPO_SSH"

echo ""
echo "✅ Chezmoi configured successfully!"
echo "   Your dotfiles have been applied from https://github.com/fyfirman/dotfiles"
