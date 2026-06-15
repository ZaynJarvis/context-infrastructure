#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

python3 rules/skills/pdf_to_markdown_cli.py --help >/dev/null
echo "ok: pdf_to_markdown_cli help"

python3 rules/skills/pdf_to_markdown_cli.py doctor >/dev/null
echo "ok: pdf_to_markdown_cli doctor"

python3 tools/typefully_post.py --help >/dev/null
echo "ok: typefully_post help"

python3 tools/kit_metrics.py --help >/dev/null
echo "ok: kit_metrics help"

python3 tools/send_email_to_myself.py --help >/dev/null
echo "ok: send_email_to_myself help"

python3 periodic_jobs/ai_heartbeat/src/v0/observer.py --help >/dev/null
echo "ok: observer help"

python3 periodic_jobs/ai_heartbeat/src/v0/reflector.py --help >/dev/null
echo "ok: reflector help"

python3 -m pytest rules/skills/tests -q >/dev/null
echo "ok: pytest"
