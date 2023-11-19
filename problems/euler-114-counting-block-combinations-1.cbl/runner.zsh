#!/usr/bin/env zsh

# Set the TASK environment variable to the name of your C++ file without the extension
TASK="euler-114-counting-block-combinations-1"

# Fail (exit) immediately if any of the following commands fail.
set -e

# euler-114.cbl is named so because COBOL has a file name limit
cobc -w -Os -F -x -o ${TASK}_compiled euler-114.cbl

# The show-exec-command is available in the Einstein execution environment.
# It is also available in the `bin` directory in the project repo.  You can
# install it locally from there for testing.
for v in 7 14 28 50
do
  ./show-exec-command ./${TASK}_compiled $v
done
