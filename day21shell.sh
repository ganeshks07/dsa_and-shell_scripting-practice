# CloudTrail Last-24hr API Summary
#!/usr/bin/env bash
# Shell #17 — Summarize CloudTrail API activity in the last 24 hours by user
set -euo pipefail

START=$(date -u -d '24 hours ago' +%Y-%m-%dT%H:%M:%SZ 2>/dev/null \
        || date -u -v-24H +%Y-%m-%dT%H:%M:%SZ)   # linux || mac

echo "=== CloudTrail events since $START (top users) ==="
aws cloudtrail lookup-events \
  --start-time "$START" \
  --query 'Events[].Username' \
  --output text \
  | tr '\t' '\n' \
  | sort | uniq -c | sort -rn | head
