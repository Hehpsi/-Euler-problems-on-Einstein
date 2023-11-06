#!/usr/bin/env zsh

# Set the TASK environment variable to the name of your C++ file without the extension
TASK="euler-100-arranged-probability"

# Fail (exit) immediately if any of the following commands fail.
set -e

# Compile the C++ code
rustc -o ${TASK}_compiled ${TASK}.rs

# The show-exec-command is available in the Einstein execution environment.
# It is also available in the `bin` directory in the project repo.  You can
# install it locally from there for testing.
for v in 0 10 100 500 1000 5000 10000
do
  ./show-exec-command ./${TASK}_compiled $v
done
