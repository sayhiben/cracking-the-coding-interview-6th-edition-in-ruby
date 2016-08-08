# 1.6 String Compression
# Implement a method to perform basic string compression using the counts of
#   repeated characters. For example, the string aabcccccaaa would become
#   a2b1c5a3. If the "compressed" string would not become smaller than the
#   original string, your method should return the original string. You can
#   assume the string has only uppercase and lowercase letters (a - z).
#

# This solution iterates through the string while keeping track of the current
#   character. Each time the character changes, the previous character is saved
#   to an array along with the number of sequential occurrences. The array is
#   joined to create a string for the return value.
#
# Time complexity: Since this algorithm saves the result to an array rather than
#   continually concatenating compressed values, it runs in O(n) time.
# Space complexity: O(n) space is required in the case of all unique characters
#
def compress(str)
  compressed = []
  current = str[0]
  count = 0
  str.each_char do |char|
    if char == current
      count += 1
    else
      compressed << "#{current}#{count}"
      count = 1
      current = char
    end
  end
  compressed << "#{current}#{count}"
  result = compressed.join('')
  result.length >= str.length ? str : result
end
