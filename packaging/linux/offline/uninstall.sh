#!/usr/bin/env bash
set -euo pipefail

# Removes the user-level install created by install.sh.
# Leaves the data directory (accounts/instances) intact unless you pass --purge.

DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/atlauncher-offline"
BIN_DIR="$HOME/.local/bin"
DESKTOP_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/applications"
ICON_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/icons/hicolor/scalable/apps"

rm -f "$BIN_DIR/atlauncher-offline" \
      "$DESKTOP_DIR/atlauncher-offline.desktop" \
      "$ICON_DIR/atlauncher-offline.svg"

echo "Removed launcher wrapper, desktop entry and icon."

if [[ "${1:-}" == "--purge" ]]; then
    rm -rf "$DATA_DIR"
    echo "Purged data directory: $DATA_DIR"
else
    echo "Kept your data directory: $DATA_DIR"
    echo "Re-run with --purge to also delete it (accounts, instances, configs)."
fi

# Refresh desktop/icon caches so the menu entry disappears (ignored if tools absent).
command -v update-desktop-database >/dev/null 2>&1 && update-desktop-database "$DESKTOP_DIR" >/dev/null 2>&1 || true
command -v gtk-update-icon-cache >/dev/null 2>&1 && \
    gtk-update-icon-cache -f -t "${XDG_DATA_HOME:-$HOME/.local/share}/icons/hicolor" >/dev/null 2>&1 || true
{ command -v kbuildsycoca6 >/dev/null 2>&1 && kbuildsycoca6 >/dev/null 2>&1; } || \
    { command -v kbuildsycoca5 >/dev/null 2>&1 && kbuildsycoca5 >/dev/null 2>&1; } || true
