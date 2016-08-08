# 1.4 Palindrome Permutation
# Given a string, write a function to check if it is a permutation of a
#   palindrome. A palindrome is a word or phrase that is the same forwards and
#   backwards. A permutation is a rearrangement of letters. The palindrome does
#   not need to be limited to just dictionary words
#

# Palindromes have each character appear an even number of times when its length
#   is an even number. If a palindrome contains an odd number of characters,
#   only one character will appear an odd number of times.
#
# Time complexity: O(n)
# Space complexity: Dependent on the character set used in str. If all chars are
#   unique in str, extra space in the character_counts hash will be
#   O(str.length).
#
class PalindromePermutation
  class << self
    def check(str)
      raise ArgumentError if str.empty?

      # Strip spaces - the book's example does not consider whitespace when
      #   identifying palindromes
      str = str.delete(' ')

      character_counts = count_characters(str)
      odd_count = 0
      character_counts.values.each do |value|
        if value.odd?
          odd_count += 1
          return false if odd_count > 1 || str.length.even?
        end
      end

      true
    end

    private

    def count_characters(str)
      character_counts = {}
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
