# 5.6 Conversion
# Write a function to determine the number of bits you would need to flip to
#   convert integer A to integer B
#

def conversion_steps(a, b)
  xor = a ^ b
  count = 0
  until xor.zero?
    count += 1 if xor & 1 == 1
    xor >>= 1
  end
  count
end
