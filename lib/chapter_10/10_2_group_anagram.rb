# 10.2 Group Anagrams
# Write a method to sort an array of strings so that all the anagrams are next
#   to each other.
#
def group_anagrams(anagrams)
  lookup = {}
  anagrams.each do |anagram|
    key = anagram.chars.sort.join
    if lookup.key?(key)
      lookup[key] << anagram
    else
      lookup[key] = [anagram]
    end
  end
  lookup.map{ |k, v| v }.flatten
end
