# Setup Guide: Context Infrastructure

这是一个本地 context scaffold 的配置指南。目标不是让 AI “立刻变成你”，而是让 agent 在每次工作前能读取稳定的身份、范围、规则和工具索引。

---

## Step 1：填写身份文件（必填）

**目标**：让 agent 在 session 开始时知道正在帮谁、当前时区、沟通偏好、哪些表达方式应该避免。

### 1a. 填写 USER.md

打开 `rules/USER.md`，用自己的信息替换模板内容。

至少填写这几项：
- **称呼**：你希望 AI 怎么叫你
- **时区**：避免时间混乱
- **背景**：你是谁、你做什么
- **技术兴趣**：越具体越好
- **会让你烦的**：帮 AI 避开你讨厌的沟通方式

**验证**：填好后，在 AI 对话里问「介绍一下你对我的了解」。合格结果应该引用 `rules/USER.md` 里的具体信息，而不是泛泛描述用户。

### 1b. 自定义 SOUL.md（可选但推荐）

打开 `rules/SOUL.md`，调整 AI 的核心行为基调。

默认内容是一个行为模板。如果你不想使用 persona-heavy 的写法，可以把它压缩成更小的运行规则：行动边界、沟通风格、什么时候必须询问、什么时候可以自主推进。

---

## Step 2：探索和扩展 Skills（推荐，15 分钟）

**价值**：理解 skill 的格式，开始积累自己的可复用工作流。

### 2a. 浏览现有 Skills

打开 `rules/skills/INDEX.md`，快速扫描已有的 skill 分类：

- **BestPractice 类**：立刻可用，与你的工具和项目无关
- **Workflow 类**：调研、幻灯片制作、认知画像提取等，需要理解后适配
- **API Guide 类**：⚙️ 标记的需要配置，✅ 标记的可直接用

### 2b. 创建你的第一个 Skill

找一件你经常做的事（调用某个 API、处理某类数据、执行某个工作流），用以下格式创建 `rules/skills/<category>_<name>.md`：

```markdown
# Skill: 名称

## When to Use
什么情况下触发这个 skill

## Prerequisites  
需要什么工具/配置

## 步骤
1. 步骤一
2. 步骤二

## 示例
具体的命令或代码
```

将新 skill 添加到 `rules/skills/INDEX.md` 对应分类。

### 2c. 安装外部 public skill repo

`rules/skills/` 里的内容是 starter set，不需要把所有能力都复制进来。需要更完整的能力时，先看 [`docs/SKILL_ECOSYSTEM.md`](docs/SKILL_ECOSYSTEM.md)。那里列出了一组独立维护的 public skill repo，例如 Tavily、Google Docs、Google Maps、Outlook、Resend、OpenCode、Process Launcher、PPTX、Typefully 和 Stripe。

安装时，把目标 repo URL 交给你的 AI agent，让它从当前 workspace 的 `AGENTS.md` / `WORKSPACE.md` 出发，只暴露一个 root skill。通用技术 contract 留在 public repo；联系人 alias、本地路径、endpoint、token 和业务上下文留在本地 overlay。

### 2d. 关于 Axioms（公理）

`rules/axioms/` 包含 43 条从真实经历中蒸馏的决策原则。这些代表原作者的视角和认知模式，对你有**参考价值**，但不能替代你自己的公理。

建议：
- 先浏览 `rules/axioms/INDEX.md` 了解分类和核心含义
- 遇到共鸣的公理，标注下来
- 未来从你自己的项目经历中积累你的公理（参考同类格式）

---

## Step 3：配置记忆系统（可选）

**目标**：让定时任务把可复用观察写进 `contexts/memory/OBSERVATIONS.md`，再由人工或 reflector 把稳定规则晋升到 `rules/` 或 `rules/skills/`。

### 3a. 理解三层架构

```
L3（全局约束）: rules/ 下所有文件 → 每次 session 被动加载
L1/L2（动态记忆）: contexts/memory/OBSERVATIONS.md → agent 主动检索
```

L3 你已经配置好了（Step 1）。L1/L2 需要设置 cron 自动运行。

### 3b. 配置 OpenCode Server

`periodic_jobs/ai_heartbeat/` 的脚本依赖 OpenCode Server API。

1. 确认本地 OpenCode Server 运行（或配置连接）。
2. 复制 `.env.example` 为 `.env`，填写 `OPENCODE_BASE_URL`、`OPENCODE_USERNAME`、`OPENCODE_PASSWORD`。
3. 测试基础 CLI 表面：`./scripts/smoke.sh`。
4. 再单独试运行 observer：`python3 periodic_jobs/ai_heartbeat/src/v0/observer.py --help`。

### 3c. 配置 Cron

```bash
# 每日 8:00 AM 运行 observer（扫描当日变化）
0 8 * * * cd /path/to/your/workspace && .venv/bin/python periodic_jobs/ai_heartbeat/src/v0/observer.py >> /tmp/observer.log 2>&1

# 每周一 9:00 AM 运行 reflector（蒸馏和晋升）
0 9 * * 1 cd /path/to/your/workspace && .venv/bin/python periodic_jobs/ai_heartbeat/src/v0/reflector.py >> /tmp/reflector.log 2>&1
```

调整路径和时间为你的实际情况。

### 3d. 验证

运行一次 observer：

```bash
python3 periodic_jobs/ai_heartbeat/src/v0/observer.py 2024-01-15
```

查看 `contexts/memory/OBSERVATIONS.md` 是否有新条目写入。

---

## Step 4：扩展 Tier 2 组件（按需，30-60 分钟）

以下组件独立工作，按需配置，不配不影响核心功能。

### 语义搜索（⚙️）

当你的 `contexts/` 目录积累了足够多内容后，语义搜索让你能按意思而非关键词检索历史记录。

**需要**：LLM Studio（本地）或 OpenAI API key  
**配置**：参见 `rules/skills/semantic_search.md`

### 分享报告到 Web（⚙️）

将调研报告转为 HTML 并发布到你自己的服务器。

**需要**：一台有 SSH 访问权限的服务器  
**配置**：参见 `rules/skills/share_report.md`，替换 `<your-domain>` 和 `<your-server>`

### 发送邮件通知（⚙️）

让 AI 完成任务后发邮件通知你。

**需要**：Gmail App Password  
**配置**：参见 `rules/skills/send_email.md`

---

## 何时说明系统真的有用

**填好 USER.md 后**：agent 能准确引用你的时区、角色、偏好和 avoid-list。

**使用 2-3 周后**：`contexts/memory/OBSERVATIONS.md` 里应该有带日期、来源和后续价值判断的观察，而不是流水账。

**运行 1-2 个月记忆系统后**：应该能看到若干观察被人工或 reflector 晋升为稳定规则、skill 或 workflow。

**如果 agent 不能引用具体记录或晋升理由**：说明记忆系统没有工作，哪怕文档看起来很完整。

---

## 常见问题

**Q：axioms 能直接用吗？**  
A：可以用来理解系统的结构，但核心内容代表原作者的视角。你的 axioms 需要从你自己的经历中提炼。参考 `rules/skills/workflow_cognitive_profile_extraction.md` 了解提炼方法。

**Q：skills 能直接用吗？**  
A：✅ 标记的可以直接用。⚙️ 标记的需要替换配置（endpoint、API key、域名等）。BestPractice 类基本都可以直接用。更完整的工具型能力放在独立 public repo 里，见 [`docs/SKILL_ECOSYSTEM.md`](docs/SKILL_ECOSYSTEM.md)。

**Q：observer.py 需要什么依赖？**  
A：依赖 `opencode_client.py`（OpenCode Server 的客户端封装）。这部分需要你根据自己使用的 AI agent 框架来实现或适配。

**Q：能用其他 AI agent（不用 OpenCode）吗？**  
A：可以。`observer.py` 的核心逻辑是构造 prompt 并调用 AI；你可以替换 `opencode_client` 为 Claude API、OpenAI API 或任何支持长对话的 AI 接口。

---

## 下一步

系统搭好后，真正的工作是持续记录、删掉低价值观察、把重复出现的判断晋升为可复用规则。不要把 sample content 当成自己的长期记忆。
