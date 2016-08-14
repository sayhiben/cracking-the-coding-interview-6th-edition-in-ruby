require 'test_helper.rb'
require './lib/chapter_8/8_6_towers_of_hanoi.rb'

class TestTowersOfHanoi < Minitest::Test
  def test_towers_of_hanoi
    towers = [(0..9).to_a.reverse, [], []]
    assert [[], (9..0).to_a.reverse, []], towers_of_hanoi(towers)
  end
end
