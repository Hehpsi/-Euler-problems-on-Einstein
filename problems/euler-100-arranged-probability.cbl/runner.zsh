#!/usr/bin/env zsh

# Set the TASK environment variable to the name of your C++ file without the extension
TASK="euler-100-arranged-probability"

# Fail (exit) immediately if any of the following commands fail.
set -e

# Compile the C++ code
cobc -Wall -F -x -Os -o ${TASK}_compiled ${TASK}.cbl

# The show-exec-command is available in the Einstein execution environment.
# It is also available in the `bin` directory in the project repo.  You can
# install it locally from there for testing.
for v in 0 1000 1000000 1000000000 1000000000000
do
  ./show-exec-command ./${TASK}_compiled $v
done
