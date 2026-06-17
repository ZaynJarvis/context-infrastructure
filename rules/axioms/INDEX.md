# Active Axioms Index

This file defines the active decision filters for Zayn's context infrastructure.

The upstream axiom files in this directory are preserved as reference/sample material, but they are not active unless this index links them. Do not load the old 43-file set as Zayn's current cognitive model by default.

## How To Use

Use these axioms when a task involves architecture, agent behavior, context design, debugging, reading/research, or durable workflow decisions. They are not motivational statements; each should change a concrete choice.

## Active Set

Detailed notes live in `zayn_active.md`.

| ID | Axiom | Control Meaning |
|----|-------|-----------------|
| Z01 | Runtime contract > code narrative | Behavior is controlled by loaded contract, state, tools, and verification, not by an explanatory README. |
| Z02 | State transition > static state | The important question is how state changes, survives, resumes, and becomes visible. |
| Z03 | Source-of-truth routing | Before fixing or reading, identify which system owns the truth. |
| Z04 | Evidence ladder | Separate fact, inference, and proposal. |
| Z05 | Behavior fix != cleanup | Fix the behavior first; cleanup is a separate scoped decision. |
| Z06 | Default path as product contract | The path users/agents naturally take is part of the product, not just UX polish. |
| Z07 | Small patch, full verification | Scope the diff tightly and verify the actual target state. |
| Z08 | Context is runtime state, not memory text | Memory only matters when it affects the active decision path. |
| Z09 | Control axes before taxonomy | A taxonomy is useful only if it maps to identity, scope, lifecycle, ownership, evidence, or verification. |

## Trigger Map

- "context", "memory", "session", "task", "agent identity" -> Z02, Z03, Z08, Z09
- "debug", "root cause", "why broken" -> Z03, Z04, Z05, Z07
- "repo structure", "README", "public framing" -> Z01, Z06, Z09
- "PR", "patch", "ship" -> Z05, Z07
- "reading", "research", "paper", "trend" -> Z04, Z08, Z09

## Inactive Reference Material

The original upstream A/T/M/V/X axiom files remain in this directory for comparison. Treat them as sample content from the source repository, not as Zayn's active model.
