# 10.1 Sorted Merge
# You are given two sorted arrays, A and B, where A has a large enough buffer at
#   the end to hold B. Write a method to merge B into A in sorted order.
#
def sorted_merge(a, b)
  i = 0
  until b.empty?
    if a[i].nil? || b[0] <= a[i]
      shift(a, i)
      a[i] = b.delete_at(0)
    end
    i += 1
  end
  a
end

def shift(ary, i)
  (ary.length - 1).downto(i) do |idx|
    ary[idx] = ary[idx - 1]
  end
end
