#!/usr/bin/bash

# set -e
# set -o pipefail

mkdir -p "results"
resdir="results/$(date -I)"
mkdir -p "$resdir"

printf "Start expe at $(date -Isecond)"
SECONDS=0 # Bash' env
s=0
while [[ 1 ]] ; do
    s=$((s+1))
    printf "Run $s..."
    ../../release/search @2024-11-26_expe__8bits_full-test_HC-rand-init.status --seed=${s} > ${resdir}/run_s${s}.yaml 2>${resdir}/run_s${s}.log
    if [[ $? > 0 ]]; then
        printf "Run $s... FAIL"
    else
        printf " OK"
    fi
    duration=$SECONDS
    printf " at $((duration/60)) minutes $((duration % 60)) seconds\n"
done
