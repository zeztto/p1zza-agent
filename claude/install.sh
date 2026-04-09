#!/bin/bash
set -euo pipefail

P1ZZA_REPO_URL="${P1ZZA_REPO_URL:-https://github.com/zeztto/p1zza-agent}"
P1ZZA_REPO_REF="${P1ZZA_REPO_REF:-main}"
P1ZZA_TARBALL_URL="${P1ZZA_TARBALL_URL:-https://codeload.github.com/zeztto/p1zza-agent/tar.gz/refs/heads/$P1ZZA_REPO_REF}"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_INSTALLER="$SCRIPT_DIR/../install.sh"
TARGET="$HOME/.claude"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"

download_repo_archive() {
  local destination="$1"

  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$P1ZZA_TARBALL_URL" -o "$destination"
    return
  fi

  if command -v wget >/dev/null 2>&1; then
    wget -qO "$destination" "$P1ZZA_TARBALL_URL"
    return
  fi

  echo "curl or wget is required to download $P1ZZA_REPO_URL" >&2
  exit 1
}

bootstrap_package_if_needed() {
  local installer_path=""
  local temp_dir=""
  local archive_path=""
  local extracted_dir=""

  if [ -f "$SCRIPT_DIR/CLAUDE.md" ] && [ -d "$SCRIPT_DIR/agents" ] && [ -d "$SCRIPT_DIR/rules" ]; then
    return
  fi

  if [ "${P1ZZA_BOOTSTRAPPED:-0}" = "1" ]; then
    echo "Unable to find local Claude package files after bootstrap." >&2
    exit 1
  fi

  temp_dir="$(mktemp -d)"
  archive_path="$temp_dir/p1zza-agent.tar.gz"

  echo "Downloading p1zza-agent from $P1ZZA_REPO_URL ($P1ZZA_REPO_REF)..." >&2
  download_repo_archive "$archive_path"
  tar -xzf "$archive_path" -C "$temp_dir"
  extracted_dir="$(find "$temp_dir" -mindepth 1 -maxdepth 1 -type d | head -n 1)"
  installer_path="$extracted_dir/claude/install.sh"

  if [ ! -f "$installer_path" ]; then
    echo "Downloaded archive is missing claude/install.sh" >&2
    exit 1
  fi

  chmod +x "$installer_path"
  exec env \
    P1ZZA_BOOTSTRAPPED=1 \
    P1ZZA_REPO_URL="$P1ZZA_REPO_URL" \
    P1ZZA_REPO_REF="$P1ZZA_REPO_REF" \
    P1ZZA_TARBALL_URL="$P1ZZA_TARBALL_URL" \
    "$installer_path" "$@"
}

local_install() {
  local backup=""

  echo "Installing Claude package from: $SCRIPT_DIR"
  echo "Target: $TARGET"

  if [ -e "$TARGET" ] || [ -L "$TARGET" ]; then
    backup="$HOME/.claude-backup-$TIMESTAMP"
    mv "$TARGET" "$backup"
    echo "Backed up existing target to: $backup"
  fi

  mkdir -p "$TARGET"
  cp "$SCRIPT_DIR/CLAUDE.md" "$TARGET/"
  cp "$SCRIPT_DIR/AGENTS.md" "$TARGET/"
  cp "$SCRIPT_DIR/settings.json" "$TARGET/"
  cp "$SCRIPT_DIR/settings.local.json" "$TARGET/"
  cp -R "$SCRIPT_DIR/agents" "$TARGET/"
  cp -R "$SCRIPT_DIR/rules" "$TARGET/"
  cp -R "$SCRIPT_DIR/scripts" "$TARGET/"
  cp -R "$SCRIPT_DIR/mcp-configs" "$TARGET/"
  find "$TARGET" -name '.DS_Store' -delete 2>/dev/null || true

  echo "Claude package installed to: $TARGET"
}

if [ -x "$ROOT_INSTALLER" ]; then
  P1ZZA_INSTALL_MODE=claude P1ZZA_AUTO_CONFIRM="${P1ZZA_AUTO_CONFIRM:-1}" exec "$ROOT_INSTALLER" "$@"
fi

bootstrap_package_if_needed "$@"
local_install
