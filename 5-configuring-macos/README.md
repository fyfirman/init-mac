# 5. Configuring macOS

This guide will help you configure various macOS system settings.

## Configuration Steps

### 1. Configure Mouse Speed to Fastest

Open Terminal and run:
```bash
defaults write -g com.apple.mouse.scaling 0.0
```

Or manually:
1. Open **System Settings** (or **System Preferences** on older macOS)
2. Go to **Mouse** (or search for "mouse")
3. Adjust **Tracking speed** slider to the **fastest** setting

### 2. Hide Recent Apps in Dock

Run this command in Terminal:
```bash
defaults write com.apple.dock show-recents -bool false
killall Dock
```

Or manually:
1. Open **System Settings**
2. Go to **Dock & Menu Bar** (or **Dock**)
3. Toggle off **Show recent applications in Dock**

### 3. Show Battery Percentage

Run this command in Terminal:
```bash
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
```

Or manually:
1. Open **System Settings**
2. Go to **Battery** (or **Battery** in the sidebar)
3. Check **Show percentage**

### 4. Disable Corner Shortcuts

Run this command in Terminal:
```bash
# Disable all hot corners
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-br-corner -int 0
killall Dock
```

Or manually:
1. Open **System Settings**
2. Go to **Desktop & Dock** > **Hot Corners...** (or **Mission Control** settings)
3. Set all four corners to **-**

### 5. Disable Back/Forward by Touch Bar Slide Left/Right

Run this command in Terminal:
```bash
defaults write com.apple.touchbar.agent PresentationModeGlobal -string "functionKeys"
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0
```

Note: The Touch Bar back/forward gestures are primarily controlled through Trackpad settings. The above command modifies trackpad gesture settings that may affect similar behaviors.

Or manually (if applicable):
1. Open **System Settings**
2. Go to **Trackpad** settings
3. Navigate to **More Gestures**
4. Disable **Swipe between pages** or similar gesture controls

## Quick Setup Script

You can run all the above configurations at once with this script:

```bash
#!/bin/bash

# Configure mouse speed to fastest
defaults write -g com.apple.mouse.scaling 0.0

# Hide recent apps in dock
defaults write com.apple.dock show-recents -bool false

# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Disable corner shortcuts
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-br-corner -int 0

# Reload Dock to apply changes
killall Dock

echo "Configuration complete!"
```

To apply, save the script as `configure-macos.sh` and run:
```bash
chmod +x configure-macos.sh
./configure-macos.sh
```

## Notes

- Some changes require logging out and back in, or restarting the system
- Keyboard shortcut changes depend on the specific macOS version
- Touch Bar is only available on certain MacBook Pro models (2016-2019)
