# 8.9 Parens
# Implement an algorithm to print all valid combinations of n pairs of parens
#

def parens(n)
  result = []
  generate_parens(n, n, '', result)
  result
end

def generate_parens(left_remaining, right_remaining, prefix, result)
  return if left_remaining.negative? || right_remaining < left_remaining
  if left_remaining.zero? && right_remaining.zero?
    result << prefix
  else
    generate_parens(left_remaining - 1, right_remaining, prefix + '(', result)
    generate_parens(left_remaining, right_remaining - 1, prefix + ')', result)
  end
end
