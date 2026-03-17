# Antigravity Integration

The ASO skill is packaged as an Antigravity-compatible `SKILL.md` file installed to `~/.gemini/antigravity/skills/`.

## Install

```bash
cp integrations/antigravity/SKILL.md ~/.gemini/antigravity/skills/aso-skill.md
```

## Activate the Skill

In Antigravity, activate the skill by its name:

```
Use the aso-skill to research keywords for my mobile app.
```

## File Format

The skill uses Antigravity-compatible frontmatter:

```yaml
---
name: aso-skill
description: Complete App Store Optimization toolkit for researching, optimizing, and tracking mobile app performance
risk: low
source: community
date_added: '2026-03-17'
---
```
