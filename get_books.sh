#!/bin/bash
set -euo pipefail

S1="$1"
S2="$2"

mkdir -p "$S2"

aws s3 sync "s3://$S1" "$S2" --exclude "*" --include "*.txt"

echo "File Path" > book_list.txt

find "$S2" -type f -name "*.txt" | sort >> book_list.txt

echo "Number of books:"
tail -n +2 book_list.txt | wc -l
