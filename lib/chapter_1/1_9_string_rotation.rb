# 1.9 String Rotation
# Assume you have a method isSubstring which checks if one word is a substring
#   of another. Given two strings, s1 and s2, write code to check if s2 is a
#   rotation of s1 using only one call to isSubstring.
#

# A ruby version of "isSubstring" is the same as String#include?
def substring?(haystack, needle)
  haystack.include?(needle)
end

# This question is more trivia than problem solving. When a string is rotated,
#   you can concatenate it to itself to obtain a string which contains the
#   original string inside. E.g., "erbottlewat" concatenated to itself is
#   "erbottlewaterbottlewat".
#
def rotation?(str1, str2)
  substring?("#{str2}#{str2}", str1)
end
