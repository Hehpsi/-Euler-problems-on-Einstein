#!/usr/bin/env zsh

# Set the TASK environment variable to the name of your C++ file without the extension
TASK="euler-78-coin-partitions"

# Fail (exit) immediately if any of the following commands fail.
set -e

# Compile the C++ code
rustc -o ${TASK}_compiled ${TASK}.rs

# The show-exec-command is available in the Einstein execution environment.
# It is also available in the `bin` directory in the project repo.  You can
# install it locally from there for testing.
for v in 100 1000 10000 100000 1000000
do
  show-exec-command ./${TASK}_compiled $v
done
