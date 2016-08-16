require 'test_helper.rb'
require './lib/chapter_8/8_14_boolean_evaluation.rb'

class TestBooleanEvaluation < Minitest::Test
  def test_boolean_evaluation
    assert_equal 2, count_eval("1^0|0|1", false)
    assert_equal 10, count_eval("0&0&0&1^1|0", true)
  end
end
