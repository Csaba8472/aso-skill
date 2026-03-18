# OpenCode Integration

The ASO skill is available as a project-scoped agent for OpenCode. The agent uses `.md` files with YAML frontmatter stored in `.opencode/agents/`.

## Install

```bash
# Run from your project root
mkdir -p .opencode/agents
cp /path/to/aso-skill/integrations/opencode/app-store-optimization.md .opencode/agents/
```

## Activate the Agent

In OpenCode, invoke the agent with the `@` prefix:

```
@app-store-optimization help me research keywords for my fitness app.
```

```
@app-store-optimization optimize my Apple App Store metadata.
```

You can also select the agent from the OpenCode UI's agent picker.

## Project vs Global

Agents in `.opencode/agents/` are **project-scoped**. To make the agent available globally across all projects, copy it to your OpenCode config directory:

```bash
mkdir -p ~/.config/opencode/agents
cp integrations/opencode/app-store-optimization.md ~/.config/opencode/agents/
```
