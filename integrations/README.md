# ASO Skill Integrations

This directory contains the ASO skill adapted for various AI coding tools and assistants.

## Supported Tools

- **[Gemini CLI](#gemini-cli)** — Extension with slash commands and full Python tools
- **[GitHub Copilot](#github-copilot)** — `.md` agents, use the repo directly
- **[Antigravity](#antigravity)** — Full `SKILL.md` + Python tools
- **[OpenCode](#opencode)** — `.md` agent files in `opencode/`
- **[OpenClaw](#openclaw)** — `SOUL.md` + `AGENTS.md` + `IDENTITY.md` + Python tools
- **[Cursor](#cursor)** — `.mdc` rule files in `cursor/`
- **[Aider](#aider)** — `CONVENTIONS.md` in `aider/`
- **[Windsurf](#windsurf)** — `.windsurfrules` in `windsurf/`

## Quick Install Script

You can run one script to apply the same setup commands documented below. This script now installs **full capabilities**, including all Python tools and slash commands.

```bash
# Install everything from this README
bash integrations/install-integrations.sh all

# Install selected integrations
bash integrations/install-integrations.sh gemini-cli cursor

# Set a different target project directory for project-scoped integrations
bash integrations/install-integrations.sh --project-dir /path/to/project aso
```

---

## Gemini CLI

The ASO skill is now a first-class Gemini CLI extension with **slash commands** and **full Python tools**.

### Install
```bash
bash integrations/install-integrations.sh gemini-cli
```

### Commands
- `/aso:full-audit` — Complete ASO audit workflow
- `/aso:optimize` — Quick metadata optimization
- `/aso:prelaunch` — Pre-launch checklist & timeline
- `/aso:competitor` — Competitive intelligence

See [gemini-cli/README.md](gemini-cli/README.md) for details.

---

## Antigravity

The ASO skill is packaged as an Antigravity-compatible skill with full Python tools.

### Install
```bash
bash integrations/install-integrations.sh antigravity
```

See [antigravity/README.md](antigravity/README.md) for details.

---

## GitHub Copilot

The ASO skill works natively with GitHub Copilot. Agents use the existing `.md` + YAML frontmatter format.

### Install
```bash
bash integrations/install-integrations.sh github-copilot
```

See [github-copilot/README.md](github-copilot/README.md) for details.

---

## OpenClaw

The ASO skill is packaged as an OpenClaw workspace with full Python tools.

### Install
```bash
bash integrations/install-integrations.sh openclaw
```

See [openclaw/README.md](openclaw/README.md) for details.

---

## Cursor

The ASO skill becomes a project-scoped Cursor `.mdc` rule file.

### Install
```bash
bash integrations/install-integrations.sh cursor
```

See [cursor/README.md](cursor/README.md) for details.

---

## Aider

All ASO skill instructions are consolidated into a single `CONVENTIONS.md` file.

### Install
```bash
bash integrations/install-integrations.sh aider
```

See [aider/README.md](aider/README.md) for details.

---

## Windsurf

All ASO skill instructions are consolidated into a single `.windsurfrules` file.

### Install
```bash
bash integrations/install-integrations.sh windsurf
```

See [windsurf/README.md](windsurf/README.md) for details.
