#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd -- "$SCRIPT_DIR/.." && pwd)"
PROJECT_DIR="$(pwd)"
DRY_RUN=false

TOOLS=(
  "github-copilot"
  "antigravity"
  "gemini-cli"
  "opencode"
  "openclaw"
  "cursor"
  "aider"
  "windsurf"
)

usage() {
  cat <<'EOF'
Usage:
  install-integrations.sh [--dry-run] [--project-dir PATH] [tool ...]

Tools:
  all
  github-copilot
  antigravity
  gemini-cli
  opencode
  openclaw
  cursor
  aider
  windsurf

Notes:
  - If no tool is provided, "all" is used.
  - Project-scoped tools (opencode, cursor, aider, windsurf) are installed to --project-dir
    (defaults to current working directory).
EOF
}

log() {
  printf '%s\n' "$*"
}

die() {
  printf 'Error: %s\n' "$*" >&2
  exit 1
}

run() {
  if [[ "$DRY_RUN" == "true" ]]; then
    printf '[dry-run]'
    printf ' %q' "$@"
    printf '\n'
    return 0
  fi
  "$@"
}

copy_file() {
  local source_path="$1"
  local destination="$2"
  [[ -f "$source_path" ]] || die "Missing source file: $source_path"
  run cp "$source_path" "$destination"
}

copy_skill_tools() {
  local dest_dir="$1"
  log "Copying Python tools to $dest_dir..."
  run mkdir -p "$dest_dir/lib"
  run cp "$ROOT_DIR/app-store-optimization/"*.py "$dest_dir/"
  run cp "$ROOT_DIR/app-store-optimization/lib/"* "$dest_dir/lib/"
  run cp "$ROOT_DIR/app-store-optimization/"*.json "$dest_dir/"
}

copy_templates() {
  local dest_dir="$1"
  log "Copying templates to $dest_dir..."
  run mkdir -p "$dest_dir/templates"
  run cp "$ROOT_DIR/.claude/templates/"*.md "$dest_dir/templates/"
}

install_github_copilot() {
  log "Installing GitHub Copilot integration..."
  local global_agents="$HOME/.github/agents"
  local global_copilot="$HOME/.copilot/agents"
  local project_agents="$PROJECT_DIR/.github/agents"
  
  run mkdir -p "$global_agents" "$global_copilot" "$project_agents"
  
  local md_files=("$SCRIPT_DIR/github-copilot/"*.md)
  [[ ${#md_files[@]} -gt 0 ]] || die "No GitHub Copilot markdown files found"
  
  local file
  for file in "${md_files[@]}"; do
    copy_file "$file" "$global_agents/"
    copy_file "$file" "$global_copilot/"
    copy_file "$file" "$project_agents/"
  done
  
  # Copy templates to project agents dir
  copy_templates "$project_agents"
}

install_antigravity() {
  log "Installing Antigravity integration..."
  local global_dest="$HOME/.gemini/antigravity/skills/aso-skill"
  local project_dest="$PROJECT_DIR/.gemini/antigravity/skills/aso-skill"
  
  run mkdir -p "$global_dest" "$project_dest"
  copy_file "$SCRIPT_DIR/antigravity/SKILL.md" "$global_dest/SKILL.md"
  copy_file "$SCRIPT_DIR/antigravity/SKILL.md" "$project_dest/SKILL.md"
  
  copy_skill_tools "$global_dest"
  copy_skill_tools "$project_dest"
  copy_templates "$global_dest"
  copy_templates "$project_dest"
}

install_gemini_cli() {
  log "Installing Gemini CLI integration..."
  local global_base="$HOME/.gemini/extensions/aso-skill"
  local project_base="$PROJECT_DIR/.gemini/extensions/aso-skill"
  
  # Install extension metadata and commands
  for base in "$global_base" "$project_base"; do
    run mkdir -p "$base/skills/app-store-optimization"
    run mkdir -p "$base/skills/aso-master"
    run mkdir -p "$base/skills/aso-research"
    run mkdir -p "$base/skills/aso-optimizer"
    run mkdir -p "$base/skills/aso-strategist"
    run mkdir -p "$base/commands/aso"
    
    copy_file "$SCRIPT_DIR/gemini-cli/gemini-extension.json" "$base/"
    
    # Copy main skill
    copy_file "$SCRIPT_DIR/gemini-cli/skills/app-store-optimization/SKILL.md" \
      "$base/skills/app-store-optimization/SKILL.md"
    copy_skill_tools "$base/skills/app-store-optimization"
    
    # Copy sub-agents as skills
    copy_file "$SCRIPT_DIR/gemini-cli/skills/aso-master/SKILL.md" "$base/skills/aso-master/SKILL.md"
    copy_file "$SCRIPT_DIR/gemini-cli/skills/aso-research/SKILL.md" "$base/skills/aso-research/SKILL.md"
    copy_file "$SCRIPT_DIR/gemini-cli/skills/aso-optimizer/SKILL.md" "$base/skills/aso-optimizer/SKILL.md"
    copy_file "$SCRIPT_DIR/gemini-cli/skills/aso-strategist/SKILL.md" "$base/skills/aso-strategist/SKILL.md"
    
    # Copy slash commands
    run cp "$SCRIPT_DIR/gemini-cli/commands/aso/"*.toml "$base/commands/aso/"
    
    # Copy templates
    copy_templates "$base"
  done
}

install_opencode() {
  log "Installing OpenCode integration..."
  local project_agents="$PROJECT_DIR/.opencode/agents"
  run mkdir -p "$project_agents"
  
  local md_files=("$SCRIPT_DIR/opencode/"*.md)
  local file
  for file in "${md_files[@]}"; do
    copy_file "$file" "$project_agents/"
  done
  
  # Copy templates
  copy_templates "$project_agents"
}

install_openclaw() {
  log "Installing OpenClaw integration..."
  local global_dest="$HOME/.openclaw/aso-skill/app-store-optimization"
  local project_dest="$PROJECT_DIR/.openclaw/aso-skill/app-store-optimization"
  
  for dest in "$global_dest" "$project_dest"; do
    run mkdir -p "$dest"
    copy_file "$SCRIPT_DIR/openclaw/app-store-optimization/SOUL.md" "$dest/"
    copy_file "$SCRIPT_DIR/openclaw/app-store-optimization/AGENTS.md" "$dest/"
    copy_file "$SCRIPT_DIR/openclaw/app-store-optimization/IDENTITY.md" "$dest/"
    copy_skill_tools "$dest"
    copy_templates "$dest"
  done
}

install_cursor() {
  log "Installing Cursor integration..."
  run mkdir -p "$PROJECT_DIR/.cursor/rules"
  copy_file "$SCRIPT_DIR/cursor/app-store-optimization.mdc" "$PROJECT_DIR/.cursor/rules/"
}

install_aider() {
  log "Installing Aider integration..."
  copy_file "$SCRIPT_DIR/aider/CONVENTIONS.md" "$PROJECT_DIR/"
}

install_windsurf() {
  log "Installing Windsurf integration..."
  copy_file "$SCRIPT_DIR/windsurf/.windsurfrules" "$PROJECT_DIR/"
}

is_known_tool() {
  local candidate="$1"
  local known
  for known in "${TOOLS[@]}"; do
    if [[ "$known" == "$candidate" ]]; then
      return 0
    fi
  done
  return 1
}

main() {
  local selected_tools=()
  local arg

  while [[ $# -gt 0 ]]; do
    arg="$1"
    case "$arg" in
      -h|--help)
        usage
        exit 0
        ;;
      --dry-run)
        DRY_RUN=true
        ;;
      --project-dir)
        shift
        [[ $# -gt 0 ]] || die "--project-dir requires a path"
        PROJECT_DIR="$1"
        ;;
      --project-dir=*)
        PROJECT_DIR="${arg#*=}"
        ;;
      all)
        selected_tools=("${TOOLS[@]}")
        ;;
      *)
        if is_known_tool "$arg"; then
          selected_tools+=("$arg")
        else
          die "Unknown tool: $arg (run with --help)"
        fi
        ;;
    esac
    shift
  done

  if [[ ${#selected_tools[@]} -eq 0 ]]; then
    selected_tools=("${TOOLS[@]}")
  fi

  [[ -d "$PROJECT_DIR" ]] || die "Project directory does not exist: $PROJECT_DIR"
  PROJECT_DIR="$(cd "$PROJECT_DIR" && pwd)"

  log "Using project directory: $PROJECT_DIR"
  if [[ "$DRY_RUN" == "true" ]]; then
    log "Dry-run mode enabled; no files will be written."
  fi

  local tool
  for tool in "${selected_tools[@]}"; do
    case "$tool" in
      github-copilot) install_github_copilot ;;
      antigravity) install_antigravity ;;
      gemini-cli) install_gemini_cli ;;
      opencode) install_opencode ;;
      openclaw) install_openclaw ;;
      cursor) install_cursor ;;
      aider) install_aider ;;
      windsurf) install_windsurf ;;
      *) die "Unhandled tool: $tool" ;;
    esac
  done

  log "Done. All integrations are set up properly with full agents, skills, templates, and Python tools."
}

main "$@"
