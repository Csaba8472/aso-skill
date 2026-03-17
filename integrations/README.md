# ASO Skill Integrations

This directory contains the ASO skill adapted for various AI coding tools and assistants.

## Supported Tools

- **[GitHub Copilot](#github-copilot)** — `.md` agents, use the repo directly
- **[Antigravity](#antigravity)** — `SKILL.md` per agent in `antigravity/`
- **[Gemini CLI](#gemini-cli)** — extension + `SKILL.md` files in `gemini-cli/`
- **[OpenCode](#opencode)** — `.md` agent files in `opencode/`
- **[OpenClaw](#openclaw)** — `SOUL.md` + `AGENTS.md` + `IDENTITY.md` workspaces
- **[Cursor](#cursor)** — `.mdc` rule files in `cursor/`
- **[Aider](#aider)** — `CONVENTIONS.md` in `aider/`
- **[Windsurf](#windsurf)** — `.windsurfrules` in `windsurf/`

---

## GitHub Copilot

The ASO skill works natively with GitHub Copilot. Agents use the existing `.md` + YAML frontmatter format.

```bash
# Copy agents to your GitHub Copilot agents directory
cp integrations/github-copilot/*.md ~/.github/agents/
cp integrations/github-copilot/*.md ~/.copilot/agents/
```

See [github-copilot/README.md](github-copilot/README.md) for details.

---

## Antigravity

The ASO skill is packaged as an Antigravity-compatible `SKILL.md` file.

```bash
cp integrations/antigravity/SKILL.md ~/.gemini/antigravity/skills/
```

See [antigravity/README.md](antigravity/README.md) for details.

---

## Gemini CLI

The ASO skill is packaged as a Gemini CLI extension with a skill file.

```bash
mkdir -p ~/.gemini/extensions/aso-skill/skills/app-store-optimization
cp integrations/gemini-cli/gemini-extension.json ~/.gemini/extensions/aso-skill/
cp integrations/gemini-cli/skills/app-store-optimization/SKILL.md \
   ~/.gemini/extensions/aso-skill/skills/app-store-optimization/
```

See [gemini-cli/README.md](gemini-cli/README.md) for details.

---

## OpenCode

The ASO skill is available as a project-scoped agent for OpenCode.

```bash
mkdir -p .opencode/agents
cp integrations/opencode/app-store-optimization.md .opencode/agents/
```

See [opencode/README.md](opencode/README.md) for details.

---

## OpenClaw

The ASO skill is packaged as an OpenClaw workspace.

```bash
mkdir -p ~/.openclaw/aso-skill/app-store-optimization
cp integrations/openclaw/app-store-optimization/SOUL.md \
   ~/.openclaw/aso-skill/app-store-optimization/
cp integrations/openclaw/app-store-optimization/AGENTS.md \
   ~/.openclaw/aso-skill/app-store-optimization/
cp integrations/openclaw/app-store-optimization/IDENTITY.md \
   ~/.openclaw/aso-skill/app-store-optimization/
```

See [openclaw/README.md](openclaw/README.md) for details.

---

## Cursor

The ASO skill becomes a Cursor `.mdc` rule file. Rules are project-scoped.

```bash
mkdir -p .cursor/rules
cp integrations/cursor/app-store-optimization.mdc .cursor/rules/
```

See [cursor/README.md](cursor/README.md) for details.

---

## Aider

All ASO skill instructions are consolidated into a single `CONVENTIONS.md` file that Aider reads automatically.

```bash
cp integrations/aider/CONVENTIONS.md .
```

See [aider/README.md](aider/README.md) for details.

---

## Windsurf

All ASO skill instructions are consolidated into a single `.windsurfrules` file for your project root.

```bash
cp integrations/windsurf/.windsurfrules .
```

See [windsurf/README.md](windsurf/README.md) for details.
