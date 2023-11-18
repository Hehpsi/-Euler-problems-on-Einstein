#!/usr/bin/env zsh

# Set environ variable
TASK="euler-160-factorial-trailing-digits"

# Exit on failure
set -e

# Compile rust code
rustc -o ${TASK}_compiled ${TASK}.rs

## test
for v in 0 1000 1000000 1000000000 1000000000000
do
  show-exec-command ./${TASK}_compiled $v
done
