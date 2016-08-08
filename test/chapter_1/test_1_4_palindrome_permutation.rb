require 'test_helper.rb'
require './lib/chapter_1/1_4_palindrome_permutation.rb'

class TestPalindromePermutation < Minitest::Test
  def test_palindrome_permutation
    str = 'tact coa'
    assert PalindromePermutation.check(str)
  end

  def test_is_not_palindrome_permutation
    str = 'tacc coa'
    assert PalindromePermutation.check(str) == false
  end

  def test_empty_string
    str = ''
    assert_raises ArgumentError do
      PalindromePermutation.check(str)
    end
  end
end
