require 'test_helper.rb'
require './lib/chapter_4/4_2_minimal_tree.rb'
require './lib/chapter_4/4_5_validate_bst.rb'

class TestMinimalTree < Minitest::Test
  def test_to_bst
    values = [5, 12, 13, 15, 20, 50, 90]
    assert validate_bst(to_bst(values))
  end
end
