# 5.2 Binary to strng
# Given a real number between 0 and 1 (e.g., 0.72) that is passed in as a
#   double, print the binary representation. If the number cannot be represented
#   accurately in binary with at most 32 characters, print "ERROR"
#
# Discussion:
#   Bit shifting leftwards is equivalent to doubling the value. If the value is
#   <= 1 after being doubled, we can conclude that the next digit in the binary
#   representation of the floating point number is 1. Remove the 1 and keep
#   going until the remainder of the floating point number is 0.
#

def double_to_binary(num)
  # Check for bad input
  return 'ERROR' if num.negative? || num > 1

  # Prepend decimal
  str = '.'

  # Continue until we've found all digits.
  until num.zero?
    # We can only compute binary strings that are 1/(powers of 2), otherwise,
    #   this will be an infinite loop
    return 'ERROR' if str.length > 32

    num *= 2
    if num >= 1
      str << '1'
      num -= 1
    else
      str << '0'
    end
  end
  str
end
