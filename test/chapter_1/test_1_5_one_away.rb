require 'test_helper.rb'
require './lib/chapter_1/1_5_one_away.rb'

class TestOneAway < Minitest::Test
  def test_addition
    str1 = 'pale'
    str2 = 'ple'
    assert one_away?(str1, str2)
  end

  def test_removal
    str1 = 'pales'
    str2 = 'pale'
    assert one_away?(str1, str2)
  end

  def test_replacement
    str1 = 'pale'
    str2 = 'bale'
    assert one_away?(str1, str2)
  end

  def test_two_away
    str1 = 'pale'
    str2 = 'bake'
    assert one_away?(str1, str2) == false
  end
end
