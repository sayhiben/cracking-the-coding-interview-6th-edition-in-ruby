# 1.1 Is Unique:
#   Implement an algorithm to determine if a string has all unique characters.
#   What if you cannot use additional data structures?
#

# This solution inspects each character in a linear fashion, adding them to a
#   ruby Set along the way. If it encounters a character that has already been
#   added to the Set, it will return false.
#
# Time complexity: The linear inspection of the string takes O(n) time.
# Space complexity: O(n) extra space is used in the Set
#
def unique?(str)
  set = Set.new
  str.each_char do |char|
    return false if set.include? char
    set << char
  end
  true
end

# This (poorly named) solution to the followup question foregoes the extra O(n)
#   extra space used in the Set by utilizing bit shifting. I've included this
#   solution for the sake of completeness. I prefer the readability that the
#   Set provides to the space optimization here.
#
# Time complexity: O(n)
# Space complexity: O(1)
#
def unique_without_set?(str)
  # Initialize checker to be empty (no characters have been "marked")
  checker = 0
  str.each_char do |char|
    return false if (checker & (1 << char.ord)).positive?

    # Mark a character in the checker by bit shifting 1 a number of times equal
    #   to the character's decimal ascii value
    checker |= (1 << char.ord)
  end
  true
end
