#!/bin/bash
set -euo pipefail

S1="$1"
S2="$2"

mkdir -p "$S2"

aws s3 cp "s3://$S1" "$S2" --recursive --exclude "*" --include "*.txt"

echo "File path" > book_list.txt

find "$S2" -type f -name "*.txt" | sort >> book_list.txt

echo "Wrote $(tail -n +2 book_list.txt | wc -l) book files to book_list.txt"
