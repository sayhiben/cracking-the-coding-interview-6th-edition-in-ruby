# 8.7 Permutations without Dups
# Write a method to compute all permutations of a string of unique characters
#

def permutations(str)
  permutation(str.chars)
end

def permutation(str, prefix = '', perms = [])
  if str.length.zero?
    perms << prefix
    return
  else
    str.each_with_index do |char, i|
      remainder = Array.new(str)
      remainder.delete_at(i)
      permutation(remainder, prefix + char, perms)
    end
  end
  perms
end
