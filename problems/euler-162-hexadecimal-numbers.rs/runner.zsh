#!/usr/bin/env zsh

# Set environ variable
TASK="euler-162-hexadecimal-numbers"

# Exit on failure
set -e

# Compile rust code
rustc -o ${TASK}_compiled ${TASK}.rs

## test
for v in 3 10 16
do
  show-exec-command ./${TASK}_compiled $v
done
