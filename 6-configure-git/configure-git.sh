#!/bin/bash

# Git Configuration Script
# Simple setup for Git user identity

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if Git is installed
if ! command_exists git; then
    print_error "Git is not installed. Please install Git first."
    print_status "You can install Git using: brew install git"
    exit 1
fi

print_status "Starting Git configuration..."

# Get user input
echo
print_status "Please enter your Git configuration details:"
echo

# Get user name
read -p "Enter your full name: " USER_NAME
if [ -z "$USER_NAME" ]; then
    print_error "Name cannot be empty"
    exit 1
fi

# Get user email
read -p "Enter your email address: " USER_EMAIL
if [ -z "$USER_EMAIL" ]; then
    print_error "Email cannot be empty"
    exit 1
fi

# Validate email format (basic validation)
if [[ ! "$USER_EMAIL" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
    print_warning "Email format doesn't look valid, but continuing anyway..."
fi

echo
print_status "Configuring Git with the following details:"
print_status "Name: $USER_NAME"
print_status "Email: $USER_EMAIL"
echo

# Configure Git
print_status "Setting Git user name..."
git config --global user.name "$USER_NAME"

print_status "Setting Git user email..."
git config --global user.email "$USER_EMAIL"

# Set some basic Git configurations
print_status "Setting up basic Git configurations..."

# Set default branch to main
git config --global init.defaultBranch main

# Set push default
git config --global push.default simple

# Set credential helper for macOS
git config --global credential.helper osxkeychain

# Configure line endings for macOS
git config --global core.autocrlf input
git config --global core.safecrlf true

# Set up some useful aliases
print_status "Setting up useful Git aliases..."

git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.unstage 'reset HEAD --'
git config --global alias.last 'log -1 HEAD'

print_success "Git configuration completed successfully!"
echo

# Display current configuration
print_status "Current Git configuration:"
echo "Name: $(git config --global user.name)"
echo "Email: $(git config --global user.email)"
echo "Default branch: $(git config --global init.defaultBranch)"
echo

print_success "Git is now configured and ready to use!"
print_status "You can verify your configuration anytime with: git config --list"
