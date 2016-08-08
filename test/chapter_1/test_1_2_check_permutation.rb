require 'test_helper.rb'
require './lib/chapter_1/1_2_check_permutation.rb'

class TestCheckPermutation < Minitest::Test
  def test_is_permutation
    str1 = 'some string'
    str2 = 'emos gnirts'
    assert PermutationChecker.check(str1, str2)
  end

  def test_is_not_permutation
    str1 = 'some string'
    str2_different = 'emas gnirts'
    str2_missing = 'emo gnirts'
    str2_extra = 'emos gnirtss'

    assert PermutationChecker.check(str1, str2_different) == false
    assert PermutationChecker.check(str1, str2_missing) == false
    assert PermutationChecker.check(str1, str2_extra) == false
  end
end
