# Essential Programming Languages Installation Guide

This directory contains installation scripts for essential programming languages that should be installed before other development tools and applications.

## Overview

This guide covers the installation of:
- **Golang (Go)** - Google's programming language for building simple, reliable, and efficient software
- **Rust** - A systems programming language focused on safety, speed, and concurrency

These languages are considered "essential" because they:
- Are widely used in modern software development
- Have excellent tooling and package managers
- Are prerequisites for many other development tools
- Provide foundational skills for systems programming

---

## Installation Order

**Important**: Install these languages in the following order:

1. **Golang** - Install first as it's used by many tools
2. **Rust** - Install second as it has its own comprehensive toolchain

---

## Golang Installation

### Quick Start

```bash
# Make the script executable and run it
chmod +x install-golang.sh
./install-golang.sh
```

### What the Script Does

The Golang installation script (`install-golang.sh`) performs the following:

1. **Detects System Architecture**
   - Automatically detects Apple Silicon (ARM64) or Intel (x86_64)
   - Downloads the appropriate installer

2. **Downloads and Installs Go**
   - Fetches the latest stable version from go.dev
   - Downloads the official macOS installer
   - Installs Go system-wide

3. **Sets Up Environment**
   - Creates Go workspace directory (`~/go`)
   - Adds Go to PATH in your shell configuration
   - Sets up GOPATH and GOROOT

4. **Installs Essential Tools**
   - `goimports` - Automatic import management
   - `gopls` - Language server for Go
   - `dlv` - Debugger for Go
   - `golangci-lint` - Comprehensive linter
   - And many more development tools

5. **Verifies Installation**
   - Runs a test Go program
   - Confirms all components are working

### Manual Installation (Alternative)

If you prefer manual installation:

```bash
# Download and install Go manually
curl -L https://go.dev/dl/go1.21.0.darwin-arm64.pkg -o /tmp/go.pkg
sudo installer -pkg /tmp/go.pkg -target /

# Set up environment
echo 'export PATH="/usr/local/go/bin:$PATH"' >> ~/.zshrc
echo 'export GOPATH="$HOME/go"' >> ~/.zshrc
echo 'export PATH="$GOPATH/bin:$PATH"' >> ~/.zshrc

# Create workspace
mkdir -p ~/go/{bin,src,pkg}

# Reload shell
source ~/.zshrc
```

### Post-Installation

After installation, verify everything works:

```bash
# Check Go installation
go version

# Check environment
go env GOPATH
go env GOROOT

# Test with a simple program
go run -c 'package main; import "fmt"; func main() { fmt.Println("Hello, Go!") }'
```

---

## Rust Installation

### Quick Start

```bash
# Make the script executable and run it
chmod +x install-rust.sh
./install-rust.sh
```

### What the Script Does

The Rust installation script (`install-rust.sh`) performs the following:

1. **Installs rustup**
   - Downloads and installs the official Rust installer
   - Sets up the Rust toolchain manager

2. **Configures Toolchain**
   - Sets stable as the default toolchain
   - Adds essential components (rustfmt, clippy, rust-src)
   - Adds WebAssembly target for modern development

3. **Sets Up Environment**
   - Creates Rust projects directory (`~/rust-projects`)
   - Adds Cargo to PATH in your shell configuration
   - Configures Cargo for optimal performance

4. **Installs Development Tools**
   - `cargo-edit` - Add/remove dependencies
   - `cargo-watch` - File watching for development
   - `cargo-expand` - Macro expansion
   - `rust-analyzer` - Language server
   - `wasm-pack` - WebAssembly packaging
   - And many more productivity tools

5. **Configures Cargo**
   - Sets up optimized build profiles
   - Configures incremental compilation
   - Adds useful command aliases

6. **Sets Up Git Hooks**
   - Creates pre-commit hooks for Rust projects
   - Automatically runs formatting and linting

7. **Verifies Installation**
   - Creates and runs a test Rust project
   - Confirms all tools are working

### Manual Installation (Alternative)

If you prefer manual installation:

```bash
# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Source the environment
source ~/.cargo/env

# Configure toolchain
rustup default stable
rustup component add rustfmt clippy rust-src

# Install useful tools
cargo install cargo-edit cargo-watch rust-analyzer
```

### Post-Installation

After installation, verify everything works:

```bash
# Check Rust installation
rustc --version
cargo --version
rustup --version

# Test with a simple program
cargo new hello-rust
cd hello-rust
cargo run
```

---

## Environment Setup

### Shell Configuration

Both scripts automatically configure your shell environment. The configuration is added to:

- `~/.zshrc` (for Zsh users)
- `~/.bash_profile` (for Bash users)
- `~/.profile` (for other shells)

### Environment Variables

**Golang:**
```bash
export PATH="/usr/local/go/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
```

**Rust:**
```bash
source "$HOME/.cargo/env"
```

### Workspace Directories

- **Go workspace**: `~/go/` (with `bin/`, `src/`, `pkg/` subdirectories)
- **Rust projects**: `~/rust-projects/`

---

## Verification Commands

### Golang Verification

```bash
# Check installation
go version
go env

# Test compilation
echo 'package main; import "fmt"; func main() { fmt.Println("Hello, Go!") }' > /tmp/test.go
go run /tmp/test.go

# Check tools
goimports --help
gopls version
dlv version
```

### Rust Verification

```bash
# Check installation
rustc --version
cargo --version
rustup --version

# Test compilation
cargo new /tmp/test-rust
cd /tmp/test-rust
cargo build
cargo run

# Check tools
cargo --list
rustup component list
```

---

## Troubleshooting

### Common Issues

#### Golang Issues

**"go: command not found"**
```bash
# Reload shell configuration
source ~/.zshrc

# Or restart terminal
# Check PATH
echo $PATH | grep go
```

**Permission denied during installation**
```bash
# Fix permissions
sudo chown -R $(whoami) /usr/local/go
```

**Go tools not found**
```bash
# Reinstall tools
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/gopls@latest
```

#### Rust Issues

**"rustc: command not found"**
```bash
# Source cargo environment
source ~/.cargo/env

# Or restart terminal
```

**Cargo not found**
```bash
# Reinstall rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.cargo/env
```

**Slow compilation**
```bash
# Enable incremental compilation
echo '[build]' >> ~/.cargo/config.toml
echo 'incremental = true' >> ~/.cargo/config.toml
```

### Getting Help

- **Golang**: [Official Documentation](https://golang.org/doc/)
- **Rust**: [The Rust Book](https://doc.rust-lang.org/book/)
- **rustup**: `rustup --help`
- **Cargo**: `cargo --help`

---

## Next Steps

After installing these essential languages, you can proceed with:

1. **Node.js and npm** (see `2-install-nvm/`)
2. **Homebrew applications** (see `1-brew-apps/`)
3. **Global npm packages** (see `3-install-npm-global-packages/`)
4. **Configure chezmoi** (see `4-configure-chezmoi/`)

---

## Maintenance

### Updating Golang

```bash
# Check current version
go version

# Download latest installer from https://golang.org/dl/
# Or use the installation script again
./install-golang.sh
```

### Updating Rust

```bash
# Update rustup and toolchain
rustup update

# Update all installed tools
cargo install-update -a
```

### Cleaning Up

**Golang:**
```bash
# Clean module cache
go clean -modcache

# Clean build cache
go clean -cache
```

**Rust:**
```bash
# Clean build artifacts
cargo clean

# Clean global cache
cargo cache --autoclean
```

---

## Notes

- Both languages are installed system-wide for maximum compatibility
- The scripts are idempotent - you can run them multiple times safely
- All installations include comprehensive tooling for modern development
- The scripts automatically detect your system architecture
- Git hooks are set up for automatic code quality checks
- Both languages support excellent IDE integration with VS Code/Cursor

---

## Script Features

### Golang Script Features
- ✅ Automatic architecture detection
- ✅ Latest version fetching
- ✅ Comprehensive tool installation
- ✅ Environment setup
- ✅ Workspace creation
- ✅ Installation verification
- ✅ Error handling and colored output

### Rust Script Features
- ✅ rustup installation and configuration
- ✅ Multiple toolchain support
- ✅ WebAssembly target installation
- ✅ Comprehensive development tools
- ✅ Cargo optimization configuration
- ✅ Git hooks setup
- ✅ Installation verification
- ✅ Error handling and colored output

Both scripts provide detailed progress information and handle errors gracefully, making the installation process smooth and reliable.
