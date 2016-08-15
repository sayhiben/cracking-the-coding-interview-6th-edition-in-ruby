require 'test_helper.rb'
require './lib/chapter_8/8_9_parens.rb'

class TestParens < Minitest::Test
  def test_parens
    n = 4
    expected = [
      "(((())))",
      "((()()))",
      "((())())",
      "((()))()",
      "(()(()))",
      "(()()())",
      "(()())()",
      "(())(())",
      "(())()()",
      "()((()))",
      "()(()())",
      "()(())()",
      "()()(())",
      "()()()()"
    ]
    assert_equal expected, parens(n)
  end
end
