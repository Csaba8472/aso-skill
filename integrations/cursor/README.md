# Cursor Integration

The ASO skill is converted into a Cursor `.mdc` rule file. Rules are **project-scoped** — install them from your project root.

## Install

```bash
# Run from your project root
mkdir -p .cursor/rules
cp /path/to/aso-skill/integrations/cursor/app-store-optimization.mdc .cursor/rules/
```

## Activate the Rule

In Cursor, reference the ASO skill in your prompt:

```
@app-store-optimization Research keywords for my fitness app.
```

Or enable the rule as always-on by editing its frontmatter:

```yaml
---
description: App Store Optimization specialist...
globs: ""
alwaysApply: true
---
```
