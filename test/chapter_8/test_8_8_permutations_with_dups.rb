require 'test_helper.rb'
require './lib/chapter_8/8_8_permutations_with_dups.rb'

class TestPermutationsWithDups < Minitest::Test
  def test_permutations_with_dups
    str = 'qwwerty'
    assert_equal str.chars.to_a.permutation.to_a.map(&:join).uniq,
                 permutations_with_dups(str)
  end
end
