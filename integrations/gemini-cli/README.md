# Gemini CLI Integration

The ASO skill is a first-class Gemini CLI extension. It provides specialized skills, slash commands, and full access to the ASO Python tools.

## Install

```bash
bash integrations/install-integrations.sh gemini-cli
```

This installs the extension to both `~/.gemini/extensions/aso-skill/` and your local `./.gemini/extensions/aso-skill/`.

## Slash Commands

- `/aso:full-audit` — Complete ASO audit (keyword research, metadata, strategy)
- `/aso:optimize` — Quick metadata optimization (titles, descriptions)
- `/aso:prelaunch` — Pre-launch validation (checklist, timeline, guide)
- `/aso:competitor` — Competitive intelligence (gap analysis)

## Skills

You can also reference the skills directly:
- `Use the app-store-optimization skill to...`
- `Use the aso-master orchestrator to...`
- `Invoke aso-research to...`

## Extension Structure

```
~/.gemini/extensions/aso-skill/
  gemini-extension.json
  skills/
    app-store-optimization/  # Full skill + Python tools
    aso-master/              # Orchestrator
    aso-research/            # Specialist
    aso-optimizer/           # Specialist
    aso-strategist/          # Specialist
  commands/
    aso/
      full-audit.toml
      optimize.toml
      prelaunch.toml
      competitor.toml
```
