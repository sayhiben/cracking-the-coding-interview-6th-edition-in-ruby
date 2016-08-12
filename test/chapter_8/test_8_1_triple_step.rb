require 'test_helper.rb'
require './lib/chapter_8/8_1_triple_step.rb'

class TestTripleStep < Minitest::Test
  def test_triple_step
    top_step = 3
    stepper = TripleStep.new(top_step)
    assert_equal 4, stepper.count_paths
  end
end
