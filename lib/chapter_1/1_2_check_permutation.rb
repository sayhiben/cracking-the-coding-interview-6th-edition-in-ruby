# 1.2 Check Permutation
# Given two strings, write a method to decide if one is a permutation of the
#   other.
#

# This solution checks that each character in the provided strings appears the
#   same number of times.
#
# Time complexity: O(str1.length)
# Space complexity: Dependent on the character set involved. If all characters
#   are unique in str1, it uses O(str1.length) extra space in character_counts
#
class PermutationChecker
  class << self
    def check(str1, str2)
      character_counts = count_characters(str1)

      # Decrement the count each time a character appears in str2 and check for
      #   inconsistencies
      str2.each_char do |char|
        # If char isn't in character_counts, the strings aren't permutations.
        return false unless character_counts.key?(char)
        character_counts[char] -= 1
        # If the count goes negative, str2 has more of char than str1
        return false if character_counts[char].negative?
      end

      # If any characters remain in character_counts, str1 and str2 have
      #   different characters
      return false if character_counts.values.any?(&:positive?)
      true
    end

    private

    def count_characters(str)
      character_counts = {}

      # Count the number of times each character appears
      str.each_char do |char|
        if character_counts.key?(char)
          character_counts[char] += 1
        else
          character_counts[char] = 1
        end
      end
      character_counts
    end
  end
end
