require 'test_helper.rb'
require './lib/chapter_8/8_2_robot_in_a_grid.rb'

class TestRobotInAGrid < Minitest::Test
  def test_robot_in_a_grid
    grid = [
      [0, 0, 0, 1, 0],
      [0, 0, 1, 1, 0],
      [0, 1, 0, 0, 0],
      [0, 0, 0, 1, 0],
      [0, 1, 0, 0, 0],
    ]
    expected_path = [
      [0, 1],
      [0, 2],
      [0, 3],
      [1, 3],
      [2, 3],
      [2, 4],
      [3, 4],
      [4, 4]
    ]
    assert_equal expected_path, robot_path(grid)
  end
end
