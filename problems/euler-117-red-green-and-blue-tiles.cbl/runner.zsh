#!/usr/bin/env zsh

# Set the TASK environment variable to the name of your C++ file without the extension
TASK="euler-117-red-green-and-blue-tiles"

# Fail (exit) immediately if any of the following commands fail.
set -e

# Compile the C++ code
cobc -w -F -x -Os -o ${TASK}_compiled euler-117.cbl

# The show-exec-command is available in the Einstein execution environment.
# It is also available in the `bin` directory in the project repo.  You can
# install it locally from there for testing.
for v in 5 10 20 40 50
do
  show-exec-command ./${TASK}_compiled $v
done
