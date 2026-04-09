#!/bin/bash
set -euo pipefail

P1ZZA_REPO_URL="${P1ZZA_REPO_URL:-https://github.com/zeztto/p1zza-agent}"
P1ZZA_REPO_REF="${P1ZZA_REPO_REF:-main}"
P1ZZA_TARBALL_URL="${P1ZZA_TARBALL_URL:-https://codeload.github.com/zeztto/p1zza-agent/tar.gz/refs/heads/$P1ZZA_REPO_REF}"
P1ZZA_VERSION="${P1ZZA_VERSION:-0.2.0}"
P1ZZA_LINK_SHARED_SKILLS="${P1ZZA_LINK_SHARED_SKILLS:-0}"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_INSTALLER="$SCRIPT_DIR/../install.sh"
BACKUP_ROOT="$HOME/.p1zza-agent-backups"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"

CODEX_TARGET_ROOT="$HOME/.codex"
CODEX_SKILLS_TARGET="$CODEX_TARGET_ROOT/skills"
CODEX_LEGACY_SKILLS_TARGET="$CODEX_TARGET_ROOT/.agents/skills"
CODEX_LEGACY_PACKAGE_TARGET="$CODEX_TARGET_ROOT/p1zza-agent"
SHARED_SKILLS_TARGET="$HOME/.agents/skills"
CODEX_BACKUP_PATH=""
CODEX_LEGACY_BACKUP_PATH=""
SKILL_BACKUP_DIR=""

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

  if [ -f "$SCRIPT_DIR/AGENTS.md" ] && [ -d "$SCRIPT_DIR/agents" ] && [ -d "$SCRIPT_DIR/rules" ] && [ -d "$SCRIPT_DIR/skills" ]; then
    return
  fi

  if [ "${P1ZZA_BOOTSTRAPPED:-0}" = "1" ]; then
    echo "Unable to find local Codex package files after bootstrap." >&2
    exit 1
  fi

  temp_dir="$(mktemp -d)"
  archive_path="$temp_dir/p1zza-agent.tar.gz"

  echo "Downloading p1zza-agent from $P1ZZA_REPO_URL ($P1ZZA_REPO_REF)..." >&2
  download_repo_archive "$archive_path"
  tar -xzf "$archive_path" -C "$temp_dir"
  extracted_dir="$(find "$temp_dir" -mindepth 1 -maxdepth 1 -type d | head -n 1)"
  installer_path="$extracted_dir/codex/install.sh"

  if [ ! -f "$installer_path" ]; then
    echo "Downloaded archive is missing codex/install.sh" >&2
    exit 1
  fi

  chmod +x "$installer_path"
  exec env \
    P1ZZA_BOOTSTRAPPED=1 \
    P1ZZA_REPO_URL="$P1ZZA_REPO_URL" \
    P1ZZA_REPO_REF="$P1ZZA_REPO_REF" \
    P1ZZA_TARBALL_URL="$P1ZZA_TARBALL_URL" \
    P1ZZA_LINK_SHARED_SKILLS="$P1ZZA_LINK_SHARED_SKILLS" \
    "$installer_path" "$@"
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

print_banner() {
  cat <<'EOF'
                     _                           _
 _ __  _ _ _____ __ | |__  __ _      __ _  __ _| |_ _ _  ___
| '_ \| |_ /_ / '  \| '_ \/ _` |____/ _` |/ _` |  _| ' \/ -_)
| .__/|_/__/__|_|_|_|_.__/\__,_|\___\__,_|\__, |\__|_||_\___|
|_|                                       |___/
EOF
  echo "version: $P1ZZA_VERSION"
  echo "repo:    $P1ZZA_REPO_URL"
  echo "creator: h4ppy p1zza"
  echo "home:    https://p1zza.kr"
}

local_install() {
  local item
  local target_path
  local skill_dir
  local skill_source_root
  local skill_target_root
  local legacy_skill_target_root

  echo "Installing Codex package from: $SCRIPT_DIR"
  echo "Target root:    $CODEX_TARGET_ROOT"
  echo "Skills target:  $CODEX_SKILLS_TARGET/p1zza-*"
  if [ "$P1ZZA_LINK_SHARED_SKILLS" = "1" ]; then
    echo "Shared links:   $SHARED_SKILLS_TARGET/p1zza-*"
  fi

  mkdir -p "$CODEX_TARGET_ROOT"

  if [ -e "$CODEX_LEGACY_PACKAGE_TARGET" ] || [ -L "$CODEX_LEGACY_PACKAGE_TARGET" ]; then
    CODEX_LEGACY_BACKUP_PATH="$(backup_path "$CODEX_LEGACY_PACKAGE_TARGET" "codex-legacy-package")"
    echo "Backed up legacy nested package to: $CODEX_LEGACY_BACKUP_PATH"
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

  cp "$SCRIPT_DIR/AGENTS.md" "$CODEX_TARGET_ROOT/"
  cp -R "$SCRIPT_DIR/agents" "$CODEX_TARGET_ROOT/"
  cp -R "$SCRIPT_DIR/rules" "$CODEX_TARGET_ROOT/"
  cp -R "$SCRIPT_DIR/docs" "$CODEX_TARGET_ROOT/"
  skill_source_root="$SCRIPT_DIR/skills"
  skill_target_root="$CODEX_SKILLS_TARGET"
  legacy_skill_target_root="$CODEX_LEGACY_SKILLS_TARGET"
  mkdir -p "$skill_target_root"

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

  echo "Codex files installed to: $CODEX_TARGET_ROOT"
  echo "Installed skills: $(find "$skill_target_root" -mindepth 1 -maxdepth 1 -type d -name 'p1zza-*' | wc -l | tr -d ' ')"
  if [ "$P1ZZA_LINK_SHARED_SKILLS" = "1" ]; then
    echo "Shared skill links: $(find "$skill_target_root" -mindepth 1 -maxdepth 1 -type d -name 'p1zza-*' | wc -l | tr -d ' ')"
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
}

if [ -x "$ROOT_INSTALLER" ]; then
  P1ZZA_INSTALL_MODE=codex P1ZZA_AUTO_CONFIRM="${P1ZZA_AUTO_CONFIRM:-1}" P1ZZA_LINK_SHARED_SKILLS="$P1ZZA_LINK_SHARED_SKILLS" exec "$ROOT_INSTALLER" "$@"
fi

bootstrap_package_if_needed "$@"
print_banner
local_install
