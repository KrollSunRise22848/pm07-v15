#!/usr/bin/env bash
set -Eeuo pipefail
umask 077
WORK="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$WORK/config.env"
mkdir -p "$WORK/out" "$WORK/backups" "$WORK/logs"
LOG="$WORK/logs/run.log"
STAMP="$(date +%Y%m%d_%H%M%S)"
log() { printf '%s [%s] %s\n' "$(date -Is)" "$1" "$2" >> "$LOG"; }
trap 'rc=$?; log ERROR "exit=$rc"; exit "$rc"' ERR
db_query() {
    "$CLIENT" --defaults-file="$AUTH" --batch --raw --skip-column-names --database="$DB" --execute="$1"
}
dump_db() {
    "$DUMP" --defaults-file="$AUTH" --single-transaction --no-tablespaces --set-gtid-purged=OFF --default-character-set=utf8mb4 --result-file="$1" "$DB"
}
run_task() {
    file="$WORK/out/mysqlcheck.txt"
    if command -v mysqlcheck >/dev/null 2>&1; then
        mysqlcheck --defaults-file="$AUTH" --check "$DB" > "$file"
    else
        db_query 'CHECK TABLE equipment,contracts,returns,access_probe;' > "$file"
        awk -F '\t' '$3 != "status" || $4 != "OK" {bad=1} END {exit bad}' "$file"
    fi
    log INFO "check completed; see out/mysqlcheck.txt"
}
log INFO "START db=$DB"
started_ms="$(date +%s%3N)"
run_task
finished_ms="$(date +%s%3N)"
log INFO "elapsed_ms=$((finished_ms - started_ms))"
log INFO "END result=OK"
exit 0
