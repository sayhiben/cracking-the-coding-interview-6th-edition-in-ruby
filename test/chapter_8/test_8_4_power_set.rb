require 'test_helper.rb'
require './lib/chapter_8/8_4_power_set.rb'

class TestPowerSet < Minitest::Test
  def test_power_set
    set = Set.new(%w(a b c d))

    assert 15, power_set(set).length
  end
end
