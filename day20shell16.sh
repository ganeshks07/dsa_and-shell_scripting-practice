# CloudWatch Alarm Checker
# This script checks the status of CloudWatch alarms and sends notifications if any alarms are in the ALARM state.
#!usr/bin/env bash
# Shell #16 — List all CloudWatch alarms currently IN ALARM state
set -euo pipefail

aws cloudwatch describe-alarms --state-value ALARM --query 'MetricAlarms[*].{Name:AlarmName,State:StateValue}' --output table
--query 'MetricAlarms[*].{Name:AlarmName,State:StateValue}' --output table
--output table

#count table
Count=$(aws cloudwatch describe-alarms --state-value ALARM --query 'length(MetricAlarms)' --output text)
echo "Total number of alarms in ALARM state: $Count"

[ "$COUNT" -gt 0 ] && echo "⚠ Investigate the above!" || echo "✅ All healthy"


