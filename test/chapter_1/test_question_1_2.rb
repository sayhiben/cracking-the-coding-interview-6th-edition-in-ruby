require 'test_helper.rb'
require './lib/chapter_1/question_1_2.rb'

class TestQuestion_1_2 < Minitest::Test
  def test_is_permutation
    str1 = 'some string'
    str2 = 'emos gnirts'
    assert permutation?(str1, str2)
  end

  def test_is_not_permutation
    str1 = 'some string'
    str2_different = 'emas gnirts'
    str2_missing = 'emo gnirts'
    str2_extra = 'emos gnirtss'

    assert permutation?(str1, str2_different) == false
    assert permutation?(str1, str2_missing) == false
    assert permutation?(str1, str2_extra) == false
  end
end
