# Working Rules Index

This file defines the active working rules for Zayn's context infrastructure.

The upstream axiom files in this directory are preserved as reference/sample material, but they are not active unless this index links them. Do not load the old 43-file set as Zayn's current model by default.

## How To Use

Use these rules when a task involves architecture, agent behavior, context design, debugging, reading/research, or durable workflow decisions. They are not motivational statements; each should change a concrete choice.

## Active Set

Detailed notes live in `zayn_active.md`.

| ID | Working Rule | What It Changes |
|----|-------|-----------------|
| Z01 | Fix what the agent actually loads | Inspect the loaded files, rules, skills, memory, tools, and gates before trusting explanatory docs. |
| Z02 | Debug the handoff | Treat stale resume, restart, lost ownership, and missing memory as transition bugs. |
| Z03 | Find the source of truth first | Name the authority before changing anything. |
| Z04 | Mark fact, guess, and plan | Separate observed evidence, explanation, and next move. |
| Z05 | Do not mix fix with cleanup | Fix the behavior path first; cleanup is separate unless required. |
| Z06 | The normal path is the product | If the default path reaches wrong or stale state, the system is broken. |
| Z07 | Small patch, real verification | Keep the diff narrow and verify the target state actually changed. |
| Z08 | Memory must be in the decision path | Stored memory is archive unless it is loaded and used at the right moment. |
| Z09 | Axes before labels | Classify only when the label changes a decision. |

## Trigger Map

- "context", "memory", "session", "task", "agent identity" -> Z02, Z03, Z08, Z09
- "debug", "root cause", "why broken" -> Z03, Z04, Z05, Z07
- "repo structure", "README", "public framing" -> Z01, Z06, Z09
- "PR", "patch", "ship" -> Z05, Z07
- "reading", "research", "paper", "trend" -> Z04, Z08, Z09

## Inactive Reference Material

The original upstream A/T/M/V/X axiom files remain in this directory for comparison. Treat them as sample content from the source repository, not as Zayn's active working model.
