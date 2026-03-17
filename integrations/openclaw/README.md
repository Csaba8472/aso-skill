# OpenClaw Integration

The ASO skill is packaged as an OpenClaw workspace containing `SOUL.md`, `AGENTS.md`, and `IDENTITY.md`. The workspace installs to `~/.openclaw/aso-skill/`.

## Install

```bash
mkdir -p ~/.openclaw/aso-skill/app-store-optimization
cp integrations/openclaw/app-store-optimization/SOUL.md \
   ~/.openclaw/aso-skill/app-store-optimization/
cp integrations/openclaw/app-store-optimization/AGENTS.md \
   ~/.openclaw/aso-skill/app-store-optimization/
cp integrations/openclaw/app-store-optimization/IDENTITY.md \
   ~/.openclaw/aso-skill/app-store-optimization/
```

## Activate the Agent

After installation, the agent is available by `agentId` in OpenClaw sessions:

```
agentId: app-store-optimization
```

If the OpenClaw gateway is already running, restart it after installation:

```bash
openclaw gateway restart
```
