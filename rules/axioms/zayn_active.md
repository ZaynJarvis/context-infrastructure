# Zayn Active Axioms

These are compact working filters for agents operating in Zayn's workspace.

## Z01 Runtime Contract > Code Narrative

README and docs can explain intent, but the active contract is what the agent actually loads: `AGENTS.md`, `rules/`, skills, memory, tools, and validation gates. If behavior is wrong, fix the loaded contract or runtime path first.

## Z02 State Transition > Static State

Most important failures are transition failures: a task resumes with stale context, a daemon restarts without visible state, an agent loses ownership, or a memory exists but is not loaded at the decision point. Ask how state enters, changes, persists, and becomes inspectable.

## Z03 Source-Of-Truth Routing

Before searching or changing broadly, identify the source of truth. Code behavior belongs to files/tests/logs; deployment state belongs to runtime logs and deploy system; task state belongs to the task tracker; long-term context belongs to committed context or OpenViking.

## Z04 Evidence Ladder

Use three levels explicitly:

- confirmed fact: directly inspected source, command, log, diff, PR, or runtime state,
- inference: best explanation from facts,
- proposal: recommended next move.

Do not present inference as fact.

## Z05 Behavior Fix != Cleanup

A behavior fix changes the failing control path. Cleanup reduces confusion or debt. Do not mix them unless the cleanup is necessary for the fix; otherwise report it as a separate follow-up.

## Z06 Default Path As Product Contract

The path a user or agent naturally takes is part of the product contract. If the default path leads to the wrong workspace, stale memory, wrong repo, or invisible artifact, the system is broken even if an expert can work around it.

## Z07 Small Patch, Full Verification

Prefer a narrow diff with exact validation over broad conceptual correctness. A patch is not done until the target state is verified and the residual risk is named.

## Z08 Context Is Runtime State, Not Memory Text

A memory that is not loaded, routed, or used at the decision point is archive, not context. Context infrastructure should optimize for the active decision path: what gets read, when, by whom, under which scope, and with what authority.

## Z09 Control Axes Before Taxonomy

A taxonomy is useful only if it changes a control decision. For Zayn's systems, useful axes are usually identity, scope, session, task, lifecycle, ownership, resource binding, provenance, evidence, and verification.
