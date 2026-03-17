# Aider Integration

The ASO skill is consolidated into a single `CONVENTIONS.md` file that Aider reads automatically when present in your project root.

## Install

```bash
# Run from your project root
cp /path/to/aso-skill/integrations/aider/CONVENTIONS.md .
```

## Activate the Skill

In your Aider session, reference the ASO skill by name:

```
Use the App Store Optimization skill to research keywords for my app.
```

```
Apply the ASO skill to optimize my Google Play Store metadata.
```

## Manual Usage

You can also pass the conventions file directly:

```bash
aider --read CONVENTIONS.md
```
