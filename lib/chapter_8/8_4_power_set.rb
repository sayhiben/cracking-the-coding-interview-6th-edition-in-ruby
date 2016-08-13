# 8.4 Power Set
# Write a method to return all subsets of a set
#

# This solution builds all subsets of length 1 and stores them, then uses those
#   to build all subsets of length 2, and so on until we've generated all
#   subsets up to set.length in length
#
def power_set(set)
  subsets = [[Set.new]]
  (1..set.length).each do |i|
    generate_subsets(set, i, subsets)
  end
  subsets.flatten
end

def generate_subsets(set, i, subsets)
  subsets[i] = []
  subsets[i - 1].each do |subset|
    (set-subset).each do |el|
      subsets[i] << subset | [el] unless subsets[i].include? subset | [el]
    end
  end
end
