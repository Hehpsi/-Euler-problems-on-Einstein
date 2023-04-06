#!/usr/bin/env python3

import sys
n = int(sys.argv[1])

# We maintain the last n digits in a list which is accessed in
# a circular manner.
#
# We treat 0s specially.  We keep track of the number of zeros
# currently in the list.  If there are any zeros, then the current
# product is just 0.
#
# Otherwise, we track the actual product in `product` by multiplying
# and dividing as we proceed.
#

digits = [0] * n
zeros = n
curr = 0

product = 1
max_product = 0

for digit in map(int, sys.stdin.readline().strip()):
   # Relegate an old digit.
   #
   if digits[curr] == 0:
      zeros -= 1
   else:
      product = product // digits[curr]
   #
   # Insert the new digit.
   #
   digits[curr] = digit
   if digit == 0:
      zeros += 1
   else:
      product = product * digit
   curr = (curr + 1) % n
   #
   # New maximum?
   #
   if zeros == 0 and max_product < product:
      max_product = product

print(max_product)
