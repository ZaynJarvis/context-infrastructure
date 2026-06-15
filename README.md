# Context Infrastructure

This repo is a file-based workspace scaffold for coding agents.

It gives an agent predictable places to read durable rules, retrieve working
memory, use reusable skills, and run scheduled observation jobs. The useful
part is the contract. The sample content is not reusable as-is.

## What It Solves

Agents often lose the state that makes work safe to continue: who they are
helping, which files matter, what constraints are active, what evidence was
already checked, and which repeated workflows should become skills.

This repo makes that state inspectable on disk:

- `rules/` stores durable operating context.
- `contexts/memory/` stores observations that may be promoted later.
- `rules/skills/` stores reusable workflows and tool guides.
- `periodic_jobs/ai_heartbeat/` contains scripts for scheduled observation and
  reflection.
- `tools/` contains optional utilities that can be wired into a local workflow.

## What This Is Not

- Not a hosted memory service.
- Not a vector database replacement.
- Not a secret store.
- Not turnkey personalization.
- Not proof that the included personal rules should become yours.

Clone it to inspect the contract, then replace the sample identity, rules,
memory, and adapters with your own.

## Quick Smoke Test

```bash
git clone https://github.com/ZaynJarvis/context-infrastructure
cd context-infrastructure
python3 -m venv .venv
. .venv/bin/activate
pip install -r requirements.txt
./scripts/smoke.sh
```

Expected receipt:

```text
ok: pdf_to_markdown_cli help
ok: pdf_to_markdown_cli doctor
ok: typefully_post help
ok: kit_metrics help
ok: send_email_to_myself help
ok: observer help
ok: reflector help
ok: pytest
```

Some tools need credentials before they can do real work. The smoke test only
checks the local contract and CLI surfaces.

## Agent Contract

An agent using this workspace should:

1. Read `AGENTS.md` first.
2. Load the smallest relevant rule files, not the whole tree by default.
3. Treat `rules/USER.md` and `rules/SOUL.md` as local templates until replaced.
4. Write short-lived observations to `contexts/memory/OBSERVATIONS.md`.
5. Promote repeated, verified observations into rules or skills only after
   review.
6. Keep secrets in `.env` or an external secret manager, never in committed
   rules or memory.

The important boundary: public repo content is a scaffold. Private identity,
private observations, credentials, local paths, and personal decisions belong in
your local overlay.

## Layout

```text
context-infrastructure/
├── AGENTS.md                    # Workspace entry contract for agents
├── setup_guide.md               # Setup and adaptation guide
├── .env.example                 # Environment variable names used by tools
├── requirements.txt             # Python dependencies for smoke/local tools
│
├── docs/
│   ├── CRONTAB.md               # Scheduled job setup
│   └── SKILL_ECOSYSTEM.md       # Optional external skill repos
│
├── rules/
│   ├── SOUL.md                  # Agent behavior template
│   ├── USER.md                  # User profile template
│   ├── COMMUNICATION.md         # Communication rules
│   ├── WORKSPACE.md             # File routing index
│   ├── axioms/                  # Imported sample decision notes
│   └── skills/                  # Reusable workflow/tool guides
│
├── contexts/
│   └── memory/
│       └── OBSERVATIONS.md      # Observation log for later promotion
│
├── periodic_jobs/
│   └── ai_heartbeat/
│       ├── docs/
│       └── src/v0/
│           ├── observer.py      # L1 observation trigger
│           └── reflector.py     # L2 reflection/promotion trigger
│
├── scripts/
│   └── smoke.sh                 # Verifies local runnable surfaces
│
└── tools/                       # Optional utility scripts
```

## Current Runnable Surface

These commands are expected to run after `pip install -r requirements.txt`:

```bash
python3 rules/skills/pdf_to_markdown_cli.py --help
python3 rules/skills/pdf_to_markdown_cli.py doctor
python3 tools/typefully_post.py --help
python3 tools/kit_metrics.py --help
python3 tools/send_email_to_myself.py --help
python3 -m pytest rules/skills/tests -q
```

These commands require additional configuration:

- `periodic_jobs/ai_heartbeat/src/v0/observer.py`
- `periodic_jobs/ai_heartbeat/src/v0/reflector.py`
- `tools/semantic_search/main.py`
- `tools/ga4_metrics.py`
- scripts that call Typefully, Kit, Gmail, or OpenCode APIs

## OpenCode Configuration

The heartbeat jobs use:

```env
OPENCODE_BASE_URL=http://localhost:4096
OPENCODE_USERNAME=opencode
OPENCODE_PASSWORD=
OPENCODE_MESSAGE_TIMEOUT=3600
OPENCODE_MODEL=antigravity-gemini-3-flash
```

The observer and reflector scripts resolve paths relative to the repo root. You
should not need to hardcode `/path/to/your/workspace` in the Python files.

## Use This If

- You want an inspectable local context scaffold for coding agents.
- You are comfortable replacing sample content with your own rules and memory.
- You want skills and observations stored as plain files.
- You want scheduled jobs to propose memory updates, not silently mutate a
  hosted profile.

## Do Not Use This If

- You want a packaged app.
- You want automatic personalization without curating your own data.
- You need multi-user permissions, hosted sync, or audited secret management.
- You need a production memory database today.

## First Adaptation Checklist

1. Replace `rules/USER.md`.
2. Replace or reduce `rules/SOUL.md`.
3. Decide which imported `rules/skills/` are actually active.
4. Treat `rules/axioms/` as sample decision notes, not universal rules.
5. Copy `.env.example` to `.env` and fill only the tools you use.
6. Run `./scripts/smoke.sh`.

## License

MIT
