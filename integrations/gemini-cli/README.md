# Gemini CLI Integration

Packages the ASO skill as a Gemini CLI extension. The extension installs to `~/.gemini/extensions/aso-skill/`.

## Install

```bash
mkdir -p ~/.gemini/extensions/aso-skill/skills/app-store-optimization
cp integrations/gemini-cli/gemini-extension.json ~/.gemini/extensions/aso-skill/
cp integrations/gemini-cli/skills/app-store-optimization/SKILL.md \
   ~/.gemini/extensions/aso-skill/skills/app-store-optimization/
```

## Activate the Skill

In Gemini CLI, reference the skill by name:

```
Use the app-store-optimization skill to help me research keywords for my app.
```

## Extension Structure

```
~/.gemini/extensions/aso-skill/
  gemini-extension.json
  skills/
    app-store-optimization/SKILL.md
```
