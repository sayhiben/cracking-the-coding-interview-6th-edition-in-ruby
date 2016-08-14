require 'test_helper.rb'
require './lib/chapter_8/8_7_permutations_without_dups.rb'

class TestPermutationsWithoutDups < Minitest::Test
  def test_permutations_without_dups
    assert_equal ('a'..'f').to_a.permutation.to_a.map(&:join),
                 permutations(('a'..'f').to_a.join)
  end
end
