require 'test_helper.rb'
require './lib/chapter_5/5_6_conversion.rb'

class TestConversion < Minitest::Test
  def test_conversion
    assert_equal 2, conversion_steps(29, 15)
  end
end
