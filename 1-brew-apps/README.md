# Homebrew Installation Guide

This Brewfile contains a curated collection of command-line tools and applications for macOS development and productivity.

## Installation

```bash
brew bundle install --file=Brewfile
```

## Contents

### Custom Taps

- **hudochenkov/sshpass** - SSH password authentication support
- **italomandara/cxpatcher** - CrossOver patcher utilities
- **leoafarias/fvm** - Flutter Version Management
- **microsoft/mssql-release** - Microsoft SQL Server tools for macOS
- **minio/stable** - MinIO object storage tools

---

## Command-Line Tools (Brew)

### Development Tools

- **git** - Distributed version control system
- **gh** - GitHub's official command-line tool
- **glab** - GitLab's official command-line tool
- **gitlab-runner** - Run GitLab CI/CD jobs locally
- **cmake** - Cross-platform build system generator
- **codex** - AI-powered command-line assistant

### Cloud & Infrastructure

- **awscli** - Amazon Web Services command-line interface
- **eksctl** - Official CLI for Amazon EKS (Kubernetes)
- **cloudflared** - Cloudflare Tunnel client (formerly Argo Tunnel)
- **helm** - Kubernetes package manager
- **terraform** - Infrastructure as Code tool
- **gcloud-cli** - Google Cloud Platform command-line tools

### Database Tools

- **unixodbc** - ODBC driver manager for Unix-like systems
- **msodbcsql17** - Microsoft ODBC Driver 17 for SQL Server
- **msodbcsql18** - Microsoft ODBC Driver 18 for SQL Server
- **mssql-tools18** - SQL Server command-line utilities (sqlcmd, bcp)

### Networking & Security

- **bind** - DNS tools (dig, nslookup, host)
- **nmap** - Network discovery and security auditing tool
- **openconnect** - Open-source VPN client (Cisco AnyConnect compatible)
- **inetutils** - Collection of network utilities
- **lftp** - Sophisticated file transfer program
- **ngrok** - Expose local servers to the internet

### Programming Languages & Runtimes

- **python-tk@3.13** - Python with Tkinter GUI support
- **pyenv** - Python version management
- **openjdk@11** - Java Development Kit 11
- **php** - Server-side scripting language
- **golang-migrate** - Database migration tool written in Go

### Build Dependencies & Libraries

- **ffmpeg** - Audio and video processing toolkit

### Data Processing & Utilities

- **yq** - YAML/JSON/XML processor (like jq for YAML)
- **fzf** - Fuzzy finder for command-line
- **watch** - Execute commands periodically and display output

### Specialized Tools

- **hey** - HTTP load generator and benchmarking tool
- **sshpass** - Non-interactive SSH password authentication
- **fvm** - Flutter Version Management (manage multiple Flutter SDKs)
- **mc** - MinIO Client for cloud storage operations
- **uv** - Fast Python package installer and resolver

---

## GUI Applications (Cask)

### Development Environments

- **warp** - Modern, AI-powered terminal emulator
- **datagrip** - JetBrains database IDE
- **postman** - API development and testing platform
- **flutter** - Flutter SDK for cross-platform development
- **android-platform-tools** - ADB and other Android development tools
- **chromedriver** - WebDriver for Chrome browser automation

### Cloud Services

- **gcloud-cli** - Google Cloud Platform CLI (GUI installer)

### Productivity & Organization

- **alfred** - Application launcher and productivity tool
- **notion** - All-in-one workspace for notes and collaboration
- **notion-calendar** - Calendar app by Notion

### Window & UI Management

- **rectangle** - Window management using keyboard shortcuts
- **maccy** - Clipboard manager

### System Utilities

- **macs-fan-control** - Control Mac fan speed
- **anydesk** - Remote desktop application

### Specialized Tools

- **cxpatcher** - CrossOver patcher for running Windows apps
- **ngrok** - Secure tunneling to localhost (GUI version)

### Fonts

- **font-fira-code** - Monospaced font with programming ligatures

---

## Categories Summary

| Category | Count |
|----------|-------|
| Development Tools | 6 |
| Cloud & Infrastructure | 6 |
| Database Tools | 4 |
| Networking & Security | 6 |
| Programming Languages | 5 |
| Build Libraries | 1 |
| Data Processing | 3 |
| Specialized CLI Tools | 5 |
| Development GUI Apps | 7 |
| Productivity Apps | 3 |
| Window Management | 3 |
| System Utilities | 2 |
| Fonts | 1 |
| **Total** | **52** |

---

## Post-Installation Steps

### Java Setup
```bash
# Add OpenJDK 11 to PATH
echo 'export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"' >> ~/.zshrc
```

### Python Setup
```bash
# Initialize pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
```

### Flutter Setup
```bash
# Initialize FVM
fvm install stable
fvm global stable
```

### FZF Setup
```bash
# Set up shell integration
$(brew --prefix)/opt/fzf/install
```

### SQL Server Tools
```bash
# Add to PATH for sqlcmd
echo 'export PATH="/opt/homebrew/opt/mssql-tools18/bin:$PATH"' >> ~/.zshrc
```

---

## Maintenance

### Update all packages
```bash
brew update
brew upgrade
brew upgrade --cask
brew cleanup
```

### Backup current installations
```bash
brew bundle dump --file=Brewfile --force
```

---

## Notes

- This setup is optimized for full-stack development with focus on:
  - Cloud infrastructure (AWS, GCP, Kubernetes)
  - Database management (SQL Server, multiple databases)
  - Mobile development (Flutter, Android)
  - Network security and debugging
  - Python and data science workflows
  
- Some applications require additional configuration after installation
- Cask applications may require accessibility permissions or other system permissions
- Consider reviewing and customizing based on your specific needs

