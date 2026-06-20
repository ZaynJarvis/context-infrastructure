# Zayn Working Rules

These are working rules for agents operating in Zayn's workspace.

They are not slogans. Each rule should change what an agent checks, fixes, or verifies in a real task.

## Z01 Fix What The Agent Actually Loads

README and docs can explain intent, but behavior comes from the files, rules, skills, memory, tools, and gates the agent actually loads. If behavior is wrong, inspect that loaded path first.

## Z02 Debug The Handoff

Stale resume, daemon restart, ownership loss, and missing memory are usually handoff bugs. Check how state moves, who owns it after the transition, and how the new state becomes visible.

## Z03 Find The Source Of Truth First

Before changing anything, name the authority: repo, tests, logs, deploy system, task tracker, committed context, or OpenViking. Do not debug from a stale copy of the truth.

## Z04 Mark Fact, Guess, And Plan

Keep three things separate:

- fact: directly inspected source, command, log, diff, PR, screenshot, or runtime state,
- guess: best explanation from those facts,
- plan: recommended next move.

Do not present a guess as if it were observed.

## Z05 Do Not Mix Fix With Cleanup

Fix the failing behavior path first. Cleanup only belongs in the same change when it is needed for the fix to hold.

## Z06 The Normal Path Is The Product

If the default user or agent path hits the wrong repo, stale memory, wrong workspace, or invisible artifact, the system is broken. A workaround does not make the default path correct.

## Z07 Small Patch, Real Verification

Make the narrowest useful diff, then verify that the target state actually changed. Name remaining risk instead of implying the change is complete by intent.

## Z08 Memory Must Be In The Decision Path

Memory that is stored but not loaded, routed, or used at the decision point is archive, not context. A context system should optimize what gets read, when, by whom, under which scope, and with what authority.

## Z09 Axes Before Labels

Classify only when the label changes a decision. Useful axes are usually identity, scope, session, task, lifecycle, owner, resource binding, provenance, evidence, and verification.
