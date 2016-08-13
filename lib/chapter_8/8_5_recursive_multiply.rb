# 8.5 Recursive Multiply
# Write a recursive function to multiply two positive integers without using
#   the * operator. You can use addition, subtraction, and bit shifting, but
#   you should minimize the number of those operations.
#

# This is a naive solution that doesn't attempt to do any bit shifting. It's
#   easy to understand, but runs in O(b) time. The recursion is also somewhat
#   contrived and unnecessary in this solution.
#
def recursive_multiply_easy(a, b)
  b == 0 ? 0 : a + recursive_multiply_easy(a, b - 1)
end


