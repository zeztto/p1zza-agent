#!/bin/bash
set -euo pipefail

P1ZZA_REPO_URL="${P1ZZA_REPO_URL:-https://github.com/zeztto/p1zza-agent}"
P1ZZA_REPO_REF="${P1ZZA_REPO_REF:-main}"
P1ZZA_TARBALL_URL="${P1ZZA_TARBALL_URL:-https://codeload.github.com/zeztto/p1zza-agent/tar.gz/refs/heads/$P1ZZA_REPO_REF}"
P1ZZA_VERSION="${P1ZZA_VERSION:-0.3.1}"
P1ZZA_AUTO_CONFIRM="${P1ZZA_AUTO_CONFIRM:-0}"
P1ZZA_LINK_SHARED_SKILLS="${P1ZZA_LINK_SHARED_SKILLS:-0}"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_SRC="$SCRIPT_DIR/claude"
CODEX_SRC="$SCRIPT_DIR/codex"
BACKUP_ROOT="$HOME/.p1zza-agent-backups"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"

MODE_INPUT="${P1ZZA_INSTALL_MODE:-${1:-interactive}}"
CLAUDE_TARGET="$HOME/.claude"
CODEX_TARGET_ROOT="$HOME/.codex"
CODEX_SKILLS_TARGET="$CODEX_TARGET_ROOT/skills"
CODEX_LEGACY_SKILLS_TARGET="$CODEX_TARGET_ROOT/.agents/skills"
CODEX_LEGACY_PACKAGE_TARGET="$CODEX_TARGET_ROOT/p1zza-agent"
SHARED_SKILLS_TARGET="$HOME/.agents/skills"

CLAUDE_BACKUP_PATH=""
CODEX_BACKUP_PATH=""
CODEX_LEGACY_BACKUP_PATH=""
SKILL_BACKUP_DIR=""
INSTALLED_CLAUDE=0
INSTALLED_CODEX=0

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

bootstrap_repo_if_needed() {
  local installer_path=""
  local temp_dir=""
  local archive_path=""
  local extracted_dir=""

  if [ -d "$CLAUDE_SRC" ] || [ -d "$CODEX_SRC" ]; then
    return
  fi

  if [ "${P1ZZA_BOOTSTRAPPED:-0}" = "1" ]; then
    echo "Unable to find local p1zza-agent packages after bootstrap." >&2
    exit 1
  fi

  temp_dir="$(mktemp -d)"
  archive_path="$temp_dir/p1zza-agent.tar.gz"

  echo "Downloading p1zza-agent from $P1ZZA_REPO_URL ($P1ZZA_REPO_REF)..." >&2
  download_repo_archive "$archive_path"
  tar -xzf "$archive_path" -C "$temp_dir"
  extracted_dir="$(find "$temp_dir" -mindepth 1 -maxdepth 1 -type d | head -n 1)"
  installer_path="$extracted_dir/install.sh"

  if [ ! -f "$installer_path" ]; then
    echo "Downloaded archive is missing install.sh" >&2
    exit 1
  fi

  chmod +x "$installer_path"
  exec env \
    P1ZZA_BOOTSTRAPPED=1 \
    P1ZZA_REPO_URL="$P1ZZA_REPO_URL" \
    P1ZZA_REPO_REF="$P1ZZA_REPO_REF" \
    P1ZZA_TARBALL_URL="$P1ZZA_TARBALL_URL" \
    P1ZZA_AUTO_CONFIRM="$P1ZZA_AUTO_CONFIRM" \
    P1ZZA_LINK_SHARED_SKILLS="$P1ZZA_LINK_SHARED_SKILLS" \
    P1ZZA_INSTALL_MODE="$MODE_INPUT" \
    "$installer_path" "$@"
}

read_user_input() {
  local variable_name="$1"
  local value=""

  if exec 3</dev/tty 2>/dev/null; then
    IFS= read -r value <&3
    exec 3<&-
  elif [ -t 0 ]; then
    IFS= read -r value
  else
    echo "Interactive install requires a terminal. Use P1ZZA_INSTALL_MODE and P1ZZA_AUTO_CONFIRM=1 for non-interactive installs." >&2
    exit 1
  fi

  printf -v "$variable_name" '%s' "$value"
}

print_banner() {
  cat <<'EOF'

        __                                                       _
       /  |                                                     | |
 _ __  `| |  ____ ____  __ _           __ _   __ _   ___  _ __  | |_
| '_ \  | | |_  /|_  / / _` | ______  / _` | / _` | / _ \| '_ \ | __|
| |_) |_| |_ / /  / / | (_| ||______|| (_| || (_| ||  __/| | | || |_
| .__/ \___//___|/___| \__,_|         \__,_| \__, | \___||_| |_| \__|
| |                                           __/ |
|_|                                          |___/

EOF
  echo "version: $P1ZZA_VERSION"
  echo "repo:    $P1ZZA_REPO_URL"
  echo "creator: h4ppy p1zza"
  echo "home:    https://p1zza.kr"
}

warn_overwrite() {
  cat <<EOF

Warning:
This installer can overwrite or relink existing settings.

- Claude install replaces: $CLAUDE_TARGET
- Codex install updates:  $CODEX_TARGET_ROOT
- Codex skills install to: $CODEX_SKILLS_TARGET/p1zza-*

Existing targets will be backed up under:
- $BACKUP_ROOT
EOF
  if [ "$P1ZZA_LINK_SHARED_SKILLS" = "1" ]; then
    echo "- Codex shared links:   $SHARED_SKILLS_TARGET/p1zza-*"
  fi
}

ensure_claude_source() {
  if [ ! -d "$CLAUDE_SRC" ]; then
    echo "Claude package not found: $CLAUDE_SRC" >&2
    exit 1
  fi
}

ensure_codex_source() {
  if [ ! -d "$CODEX_SRC" ]; then
    echo "Codex package not found: $CODEX_SRC" >&2
    exit 1
  fi
}

backup_path() {
  local source_path="$1"
  local backup_name="$2"

  mkdir -p "$BACKUP_ROOT"

  if [ -e "$source_path" ] || [ -L "$source_path" ]; then
    local backup_path="$BACKUP_ROOT/${backup_name}-${TIMESTAMP}"
    mv "$source_path" "$backup_path"
    printf '%s\n' "$backup_path"
  fi
}

install_claude() {
  echo ""
  echo "[Claude] Installing from $CLAUDE_SRC"

  if [ -e "$CLAUDE_TARGET" ] || [ -L "$CLAUDE_TARGET" ]; then
    CLAUDE_BACKUP_PATH="$(backup_path "$CLAUDE_TARGET" "claude")"
    echo "[Claude] Backed up existing target to $CLAUDE_BACKUP_PATH"
  fi

  mkdir -p "$CLAUDE_TARGET"
  cp "$CLAUDE_SRC/CLAUDE.md" "$CLAUDE_TARGET/"
  cp "$CLAUDE_SRC/AGENTS.md" "$CLAUDE_TARGET/"
  cp "$CLAUDE_SRC/settings.json" "$CLAUDE_TARGET/"
  cp "$CLAUDE_SRC/settings.local.json" "$CLAUDE_TARGET/"
  cp -R "$CLAUDE_SRC/agents" "$CLAUDE_TARGET/"
  cp -R "$CLAUDE_SRC/rules" "$CLAUDE_TARGET/"
  cp -R "$CLAUDE_SRC/scripts" "$CLAUDE_TARGET/"
  cp -R "$CLAUDE_SRC/mcp-configs" "$CLAUDE_TARGET/"
  find "$CLAUDE_TARGET" -name '.DS_Store' -delete 2>/dev/null || true

  echo "[Claude] Installed:"
  echo "  agents:  $(find "$CLAUDE_TARGET/agents" -name '*.md' | wc -l | tr -d ' ')"
  echo "  rules:   $(find "$CLAUDE_TARGET/rules" -name '*.md' | wc -l | tr -d ' ')"
  echo "  scripts: $(find "$CLAUDE_TARGET/scripts" -type f | wc -l | tr -d ' ')"
  INSTALLED_CLAUDE=1
}

install_codex() {
  local item
  local target_path
  local skill_source_root
  local skill_target_root
  local legacy_skill_target_root

  echo ""
  echo "[Codex] Installing from $CODEX_SRC"
  echo "[Codex] Target root: $CODEX_TARGET_ROOT"
  if [ "$P1ZZA_LINK_SHARED_SKILLS" = "1" ]; then
    echo "[Codex] Shared links: $SHARED_SKILLS_TARGET/p1zza-*"
  fi

  mkdir -p "$CODEX_TARGET_ROOT"

  if [ -e "$CODEX_LEGACY_PACKAGE_TARGET" ] || [ -L "$CODEX_LEGACY_PACKAGE_TARGET" ]; then
    CODEX_LEGACY_BACKUP_PATH="$(backup_path "$CODEX_LEGACY_PACKAGE_TARGET" "codex-legacy-package")"
    echo "[Codex] Backed up legacy nested package to $CODEX_LEGACY_BACKUP_PATH"
  fi

  target_path="$CODEX_TARGET_ROOT/CLAUDE.md"
  if [ -e "$target_path" ] || [ -L "$target_path" ]; then
    if [ -z "$CODEX_BACKUP_PATH" ]; then
      CODEX_BACKUP_PATH="$BACKUP_ROOT/codex-root-$TIMESTAMP"
      mkdir -p "$CODEX_BACKUP_PATH"
    fi
    mv "$target_path" "$CODEX_BACKUP_PATH/CLAUDE.md"
  fi

  for item in AGENTS.md agents rules docs; do
    target_path="$CODEX_TARGET_ROOT/$item"
    if [ -e "$target_path" ] || [ -L "$target_path" ]; then
      if [ -z "$CODEX_BACKUP_PATH" ]; then
        CODEX_BACKUP_PATH="$BACKUP_ROOT/codex-root-$TIMESTAMP"
        mkdir -p "$CODEX_BACKUP_PATH"
      fi
      mv "$target_path" "$CODEX_BACKUP_PATH/$item"
    fi
  done

  cp "$CODEX_SRC/AGENTS.md" "$CODEX_TARGET_ROOT/"
  cp -R "$CODEX_SRC/agents" "$CODEX_TARGET_ROOT/"
  cp -R "$CODEX_SRC/rules" "$CODEX_TARGET_ROOT/"
  cp -R "$CODEX_SRC/docs" "$CODEX_TARGET_ROOT/"
  skill_source_root="$CODEX_SRC/skills"
  skill_target_root="$CODEX_SKILLS_TARGET"
  legacy_skill_target_root="$CODEX_LEGACY_SKILLS_TARGET"
  mkdir -p "$skill_target_root"

  local skill_dir
  for skill_dir in "$skill_source_root"/*; do
    [ -d "$skill_dir" ] || continue

    local skill_name
    skill_name="$(basename "$skill_dir")"
    local skill_target="$skill_target_root/$skill_name"
    local legacy_skill_target="$legacy_skill_target_root/$skill_name"

    if [ -e "$skill_target" ] || [ -L "$skill_target" ]; then
      if [ -z "$CODEX_BACKUP_PATH" ]; then
        CODEX_BACKUP_PATH="$BACKUP_ROOT/codex-root-$TIMESTAMP"
        mkdir -p "$CODEX_BACKUP_PATH"
      fi
      mkdir -p "$CODEX_BACKUP_PATH/skills"
      mv "$skill_target" "$CODEX_BACKUP_PATH/skills/$skill_name"
    fi

    if [ -e "$legacy_skill_target" ] || [ -L "$legacy_skill_target" ]; then
      if [ -z "$CODEX_BACKUP_PATH" ]; then
        CODEX_BACKUP_PATH="$BACKUP_ROOT/codex-root-$TIMESTAMP"
        mkdir -p "$CODEX_BACKUP_PATH"
      fi
      mkdir -p "$CODEX_BACKUP_PATH/.agents/skills"
      mv "$legacy_skill_target" "$CODEX_BACKUP_PATH/.agents/skills/$skill_name"
    fi

    cp -R "$skill_dir" "$skill_target_root/"
  done

  if [ -d "$legacy_skill_target_root" ]; then
    rmdir "$legacy_skill_target_root" 2>/dev/null || true
    rmdir "$CODEX_TARGET_ROOT/.agents" 2>/dev/null || true
  fi

  find "$CODEX_TARGET_ROOT" -name '.DS_Store' -delete 2>/dev/null || true

  if [ "$P1ZZA_LINK_SHARED_SKILLS" = "1" ]; then
    SKILL_BACKUP_DIR="$BACKUP_ROOT/codex-skills-$TIMESTAMP"
    mkdir -p "$SKILL_BACKUP_DIR" "$SHARED_SKILLS_TARGET"

    for skill_dir in "$skill_target_root"/*; do
      [ -d "$skill_dir" ] || continue

      local skill_name
      skill_name="$(basename "$skill_dir")"
      local skill_target="$SHARED_SKILLS_TARGET/$skill_name"

      if [ -e "$skill_target" ] || [ -L "$skill_target" ]; then
        mv "$skill_target" "$SKILL_BACKUP_DIR/$skill_name"
      fi

      ln -s "$skill_dir" "$skill_target"
    done
  fi

  echo "[Codex] Installed files into: $CODEX_TARGET_ROOT"
  echo "[Codex] Installed skills: $(find "$skill_target_root" -mindepth 1 -maxdepth 1 -type d -name 'p1zza-*' | wc -l | tr -d ' ')"
  if [ "$P1ZZA_LINK_SHARED_SKILLS" = "1" ]; then
    echo "[Codex] Shared skill links: $(find "$skill_target_root" -mindepth 1 -maxdepth 1 -type d -name 'p1zza-*' | wc -l | tr -d ' ')"
  fi
  INSTALLED_CODEX=1
}

normalize_mode() {
  case "$1" in
    1|claude|Claude)
      printf '%s\n' "claude"
      ;;
    2|codex|Codex)
      printf '%s\n' "codex"
      ;;
    3|both|all|Claude+Codex|claude+codex)
      printf '%s\n' "both"
      ;;
    4|exit|quit)
      printf '%s\n' "exit"
      ;;
    *)
      printf '%s\n' "invalid"
      ;;
  esac
}

choose_mode() {
  if [ "$MODE_INPUT" != "interactive" ]; then
    normalize_mode "$MODE_INPUT"
    return
  fi

  while true; do
    cat >&2 <<'EOF'

Choose install target:
1. Claude
2. Codex
3. Claude + Codex
4. exit
EOF
    printf 'Select [1-4]: ' >&2
    read_user_input selection
    selection="$(normalize_mode "$selection")"

    if [ "$selection" != "invalid" ]; then
      printf '%s\n' "$selection"
      return
    fi

    echo "Invalid selection. Please choose 1, 2, 3, or 4." >&2
  done
}

confirm_install() {
  if [ "$P1ZZA_AUTO_CONFIRM" = "1" ]; then
    return
  fi

  printf '\nContinue? [y/N]: '
  read_user_input confirmation

  case "$confirmation" in
    y|Y|yes|YES)
      ;;
    *)
      echo "Installation cancelled."
      exit 0
      ;;
  esac
}

print_summary() {
  echo ""
  echo "Installation complete."
  echo ""

  if [ "$INSTALLED_CLAUDE" -eq 1 ]; then
    echo "Claude target: $CLAUDE_TARGET"
  fi

  if [ "$INSTALLED_CODEX" -eq 1 ]; then
    echo "Codex root:     $CODEX_TARGET_ROOT"
    echo "Codex skills:   $CODEX_SKILLS_TARGET/p1zza-*"
  fi

  if [ "$INSTALLED_CODEX" -eq 1 ] && [ "$P1ZZA_LINK_SHARED_SKILLS" = "1" ]; then
    echo "Shared links:   $SHARED_SKILLS_TARGET/p1zza-*"
  fi

  if [ -n "$CLAUDE_BACKUP_PATH" ]; then
    echo "Claude backup:  $CLAUDE_BACKUP_PATH"
  fi

  if [ -n "$CODEX_BACKUP_PATH" ]; then
    echo "Codex backup:   $CODEX_BACKUP_PATH"
  fi

  if [ -n "$CODEX_LEGACY_BACKUP_PATH" ]; then
    echo "Legacy backup:  $CODEX_LEGACY_BACKUP_PATH"
  fi

  if [ -d "$SKILL_BACKUP_DIR" ] && [ "$(find "$SKILL_BACKUP_DIR" -mindepth 1 -maxdepth 1 | wc -l | tr -d ' ')" -gt 0 ]; then
    echo "Skill backup:   $SKILL_BACKUP_DIR"
  fi

  if [ "$INSTALLED_CODEX" -eq 1 ]; then
    echo ""
    echo "Codex runtime root:"
    echo "  $CODEX_TARGET_ROOT"
  fi
}

main() {
  bootstrap_repo_if_needed "$@"
  print_banner
  warn_overwrite

  local mode
  mode="$(choose_mode)"

  if [ "$mode" = "exit" ]; then
    echo "Installer exited."
    exit 0
  fi

  case "$mode" in
    claude)
      ensure_claude_source
      ;;
    codex)
      ensure_codex_source
      ;;
    both)
      ensure_claude_source
      ensure_codex_source
      ;;
    *)
      echo "Invalid install mode: $mode" >&2
      echo "Use one of: claude, codex, both, exit" >&2
      exit 1
      ;;
  esac

  confirm_install

  case "$mode" in
    claude)
      install_claude
      ;;
    codex)
      install_codex
      ;;
    both)
      install_claude
      install_codex
      ;;
  esac

  print_summary
}

main "$@"
