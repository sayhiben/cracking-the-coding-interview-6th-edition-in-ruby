require 'test_helper.rb'
require './lib/chapter_8/8_5_recursive_multiply.rb'

class TestRecursiveMultiply < Minitest::Test
  def test_recursive_multiply_easy
    a = 312
    b = 11
    assert a*b, recursive_multiply_easy(a, b)
  end
end
