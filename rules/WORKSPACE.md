# WORKSPACE.md - Context Routing

Goal: before searching broadly, identify the source of truth and the likely directory. This file is the routing table for Zayn's context structure.

## This Repository

- Session bootstrap: `AGENTS.md`
- Active agent contract: `rules/SOUL.md`
- Active user model: `rules/USER.md`
- Communication rules: `rules/COMMUNICATION.md`
- Workspace routing: `rules/WORKSPACE.md`
- Skills index: `rules/skills/INDEX.md`
- Active axioms: `rules/axioms/INDEX.md`
- Dynamic observations: `contexts/memory/OBSERVATIONS.md`
- Observer/reflector jobs: `periodic_jobs/ai_heartbeat/`
- Tooling scripts: `tools/`

## Zayn Project Routes

Public-safe project routes only. Local absolute paths belong in a private overlay.

- `ZaynJarvis/context-infrastructure`: reproducible context structure and active bootstrap files.
- `ZaynJarvis/notes`: public notes, reading artifacts, and long-form model updates.
- `ZaynJarvis/zaynjarvis.com`: public homepage/project surface.
- `ZaynJarvis/zouk`: Zouk application/runtime work.
- OpenViking: memory/resource layer and semantic retrieval.
- `t0saki/zouk-daemon`: current daemon repository; older daemon backup directories are reference-only.

## Routing Rules

- Need behavior/persona/session guidance -> start with `AGENTS.md`, then `rules/SOUL.md`, `rules/USER.md`, `rules/COMMUNICATION.md`.
- Need where a file or project belongs -> read this file before using broad search.
- Need reusable execution workflow -> read `rules/skills/INDEX.md`.
- Need Zayn decision filters -> read `rules/axioms/INDEX.md`.
- Need recent project state -> search `contexts/memory/OBSERVATIONS.md` by topic/date; do not load the whole file if it grows large.
- Need machine-local/private context -> use local overlay or OpenViking; do not commit it to this repository.

## Source-Of-Truth Principle

Every task should name the controlling source of truth:

- code behavior -> repo file + test/build/log,
- deployment state -> deployment system + runtime logs,
- task state -> workspace task tracker,
- long-term context -> OpenViking or committed context file,
- public note state -> notes repo build/published route,
- personal/private detail -> local overlay or non-committed memory.

If a project is not listed here and becomes recurring, add a public-safe route.
