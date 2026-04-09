#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET="$HOME/.claude"

echo "=== p1zza-agent installer ==="
echo "Source: $SCRIPT_DIR"
echo "Target: $TARGET"
echo ""

# Backup existing .claude if present
if [ -d "$TARGET" ]; then
  BACKUP="$HOME/.claude-backup-$(date +%Y%m%d-%H%M%S)"
  echo "Backing up existing $TARGET → $BACKUP"
  mv "$TARGET" "$BACKUP"
  echo "Backup complete."
fi

# Create target directory
mkdir -p "$TARGET"

# Copy p1zza-agent files
echo "Installing p1zza-agent..."
cp "$SCRIPT_DIR/CLAUDE.md" "$TARGET/"
cp "$SCRIPT_DIR/AGENTS.md" "$TARGET/"
cp "$SCRIPT_DIR/settings.json" "$TARGET/"
cp "$SCRIPT_DIR/settings.local.json" "$TARGET/"
cp -r "$SCRIPT_DIR/agents" "$TARGET/"
cp -r "$SCRIPT_DIR/rules" "$TARGET/"
cp -r "$SCRIPT_DIR/scripts" "$TARGET/"
cp -r "$SCRIPT_DIR/mcp-configs" "$TARGET/"

# Clean up .DS_Store files
find "$TARGET" -name '.DS_Store' -delete 2>/dev/null || true

# Verify installation
FILE_COUNT=$(find "$TARGET" -type f | wc -l | tr -d ' ')
echo ""
echo "=== Installation complete ==="
echo "Files installed: $FILE_COUNT"
echo ""
echo "Installed components:"
echo "  agents:      $(ls "$TARGET/agents/"*.md 2>/dev/null | wc -l | tr -d ' ') agent definitions"
echo "  rules:       $(find "$TARGET/rules" -name '*.md' | wc -l | tr -d ' ') rule files"
echo "  scripts:     $(find "$TARGET/scripts" -type f | wc -l | tr -d ' ') hook scripts"
echo "  mcp-configs: $(find "$TARGET/mcp-configs" -type f | wc -l | tr -d ' ') MCP config files"
echo ""
echo "MCP servers configured:"
grep '"description"' "$TARGET/mcp-configs/mcp-servers.json" | sed 's/.*"description": "//;s/".*/  - /' || true
echo ""
echo "To restore previous config: mv $BACKUP $TARGET"
