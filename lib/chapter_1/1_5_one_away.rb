# 1.5 One Away
# There are three types of edits that can be performed on strings. Insert a
#   character, remove a character, or replace a character. Given two strings,
#   write a function to check if they are one edit (or zero edits) away.
#

# Observations:
#   - One-away additions occur when str2 is shorter than str1
#   - One-away removals occur when str2 is longer than str1
#   - One-away replacements occur when the strings are the same length
#   - If > 1 discrepancy is found, or the str lengths differ by > 1, the strings
#     are more than one character away from one another
#
# This solution iterates through each string, stopping when reaching the end of
#   the shorter of the two strings and counting differences along the way. When
#   a discrepancy is encountered, it only moves forward within the longer of the
#   two strings.
#
# Time complexity: O(n)
# Space complexity: O(1)
#
def one_away?(str1, str2)
  return false if (str1.length - str2.length).abs > 1

  i = 0
  j = 0
  diffs = 0
  while i < str1.length && j < str2.length
    # The characters are the same
    if str1[i] == str2[j]
      i += 1
      j += 1
    # Characters are different. String lengths are the same. Check linearly.
    elsif str1.length == str2.length
      diffs += 1
      i += 1
      j += 1
    # Characters are different. Str1 is longer, so only increment its cursor.
    elsif str1.length > str2.length
      diffs += 1
      i += 1
    # Characters are different. Str2 is longer, so only increment its cursor.
    else
      diffs += 1
      j += 1
    end
  end

  # There is an additional difference if the cursors aren't at the end of their
  #   respective strings. We know it's only one difference because we already
  #   checked for > 1 before the while loop.
  diffs += 1 unless i == str1.length && j == str2.length
  diffs <= 1
end
