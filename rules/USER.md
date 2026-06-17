# USER.md - Zayn

This file is the active user profile loaded by every agent session. Keep it public-safe: this repository should reproduce Zayn's context structure, not leak private memory.

## Identity

- **Name:** Zayn / `@zaynjarvis`
- **Timezone:** Asia/Singapore unless a task states otherwise.
- **Working mode:** experienced software engineer and system builder; expects agents to operate from evidence, root cause, and durable artifacts.

## Compressed Zones

Skip basic explanations unless they change a decision boundary:

- RAG, vector databases, memory systems, knowledge ingestion/import.
- AI coding, agent workflows, PR/CI/deploy loops.
- Zouk/OpenViking runtime basics: tasks, sessions, daemon/server state, MCP tools, memory plugin, activity/provenance.
- Web/infra fundamentals when they are not the live root cause.

## Current Frontier

Zayn's active architectural question is not "more memory." It is context as runtime state:

- Should context management be a memory backend, session/task runtime, multi-agent coordination substrate, or eventually partly post-trained behavior?
- What is the right unit of work: message, session, task, agent identity, workflow, resource binding, or training signal?
- How should multi-agent identity and coordination work without turning every agent into the same general assistant?
- Where does prompt/workflow/runtime engineering stop paying rent and become data/preference/post-training work?

## Output Contract

Default shape:

1. Gist: the decision or judgment in one line.
2. Evidence level: confirmed fact / inference / proposed workflow.
3. Why it matters: which system decision changes.
4. Concrete application: file, diff, command, PR, checklist, experiment, or architecture move.
5. Where this could be wrong: boundary, failure mode, missing evidence.

For engineering work, prefer:

- file:line evidence,
- exact command and observed result,
- commit/PR/artifact URL,
- validation result,
- residual risk and rollback path.

## Preferences

- Direct, concise, evidence-first.
- Strong judgment is useful when evidence level is explicit.
- Small verified patches beat broad rewrites.
- Default to producing a durable artifact: PR, note, checklist, decision memo, experiment plan, or architecture/control-axis map.
- Treat attractive taxonomy as weak unless it maps to a real control surface.

## Avoid

- Intro explanations in already-compressed domains.
- Repeating Zayn's words back as if that were progress.
- Long undifferentiated summaries.
- Product-y prose, motivational language, and generic AI trend commentary.
- Unverified numbers or runtime claims.
- Workarounds presented as root fixes.
- Hiding the final result in a thread when the top-level DM/channel is the delivery target.

## Decision Boundary

Agents should proceed inside the requested scope. Ask Zayn only when a decision requires:

- irreversible or external/public action,
- secrets, money, account state, or data deletion,
- scope expansion beyond the request,
- product taste, domain judgment, or personal preference that cannot be inferred from context.
