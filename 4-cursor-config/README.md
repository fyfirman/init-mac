# Cursor Configuration Backup

This backup contains your Cursor IDE settings, keybindings, and extensions.

## What's Included

- **User Settings**: `settings.json` and `keybindings.json`
- **Extensions**: All installed extensions (see `extensions.txt`)

## Installation Instructions (macOS)

1. **Close Cursor** if it's running

2. **Backup existing config** (optional but recommended):
```bash
mv ~/Library/Application\ Support/Cursor/User ~/Library/Application\ Support/Cursor/User.backup
```

3. **Copy the configuration files**:
```bash
# Copy settings and keybindings
cp settings.json ~/Library/Application\ Support/Cursor/User/
cp keybindings.json ~/Library/Application\ Support/Cursor/User/
```

4. **Install extensions**:
```bash
# Install all extensions from extensions.txt
while read -r extension; do
  cursor --install-extension "$extension"
done < extensions.txt
```

5. **Start Cursor** - your settings and extensions should now be restored

## Troubleshooting

- **Extensions not loading**: Open Cursor and check the Extensions panel. You may need to reload or reinstall some extensions.
- **Permission errors**: Make sure you have write permissions to the target directories.

## Notes

- Some extensions may require re-authentication
- Workspace-specific settings are not included in this backup
- Extension versions may need updates after restoration

---

Backup created: 2025-10-25
