# GitHub Copilot Integration

The ASO skill works natively with GitHub Copilot. Agents use the existing `.md` + YAML frontmatter format — no conversion needed.

## Install

```bash
# Copy all ASO agents to your GitHub Copilot agents directories
cp integrations/github-copilot/*.md ~/.github/agents/
cp integrations/github-copilot/*.md ~/.copilot/agents/
```

## Activate an Agent

In any GitHub Copilot session, reference an agent by name:

```
Activate the App Store Optimization agent and help me research keywords for my fitness app.
```

```
Use the ASO agent to optimize my Apple App Store metadata.
```

## Available Agents

- **app-store-optimization** — Complete ASO toolkit for keyword research, metadata optimization, competitor analysis, A/B testing, review analysis, and launch planning
