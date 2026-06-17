# Memory Observations

这是三层记忆系统的 L1/L2 层。每日观察由 `periodic_jobs/ai_heartbeat/src/v0/observer.py` 自动写入，每周由 `reflector.py` 整理和蒸馏。

## 格式说明

每个日期条目格式如下：

```
Date: YYYY-MM-DD

🔴 High: [方法论/约束] 描述
🟡 Medium: [项目状态/决策] 描述
🟢 Low: [任务流水] 描述
```

### 优先级定义

- **🔴 High**：跨项目通用的经验教训、硬性约束、影响系统架构的重大决策。永久保留，候选晋升为 axiom 或 skill。
- **🟡 Medium**：活跃项目的关键进展、技术决策背景、未来几周仍需参考的信息。
- **🟢 Low**：日常任务流水、瞬时 debug 记录、临时上下文。定期垃圾回收。

## 如何加载记忆

不要全文加载这个文件（可能很大）。按需检索：

```bash
# 搜索特定主题
grep -n "关键词" contexts/memory/OBSERVATIONS.md

# 搜索最近 N 天
grep -A 20 "Date: $(date -v-7d +%Y-%m-%d)" contexts/memory/OBSERVATIONS.md
```

或使用语义搜索（`rules/skills/semantic_search.md`）做跨日期语义检索。

---

<!-- 以下是记录区域，由 observer.py 自动追加 -->

Date: 2026-06-17

🔴 High: [context-infrastructure] Correct target is reproducing Zayn's active context load path, not rewriting the public README into Zayn-style product framing.
🔴 High: [privacy boundary] Public context seed should contain public-safe structure, decision filters, and routing only; private memory and machine-local paths belong in a local overlay or OpenViking.
🟡 Medium: [repo direction] The active bootstrap files are AGENTS.md, rules/SOUL.md, rules/USER.md, rules/WORKSPACE.md, rules/COMMUNICATION.md, rules/skills/INDEX.md, rules/axioms/INDEX.md, and contexts/memory/OBSERVATIONS.md.
🟡 Medium: [migration] Upstream grapeot identity and 43-axiom index should be disabled from the active load path while preserved as reference/sample content.
