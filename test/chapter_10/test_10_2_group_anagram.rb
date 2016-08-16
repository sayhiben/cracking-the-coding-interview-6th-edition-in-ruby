require 'test_helper.rb'
require './lib/chapter_10/10_2_group_anagram.rb'

class TestGroupAnagram < Minitest::Test
  def test_group_anagram
    anagrams = %w(qwerty yuiop ghjkl rewq asdf fdsa ytrewq poiuy bvcx)
    expected = %w(qwerty ytrewq yuiop poiuy ghjkl rewq asdf fdsa bvcx)
    assert_equal expected, group_anagrams(anagrams)
  end
end
