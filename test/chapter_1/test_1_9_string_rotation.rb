require 'test_helper.rb'
require './lib/chapter_1/1_9_string_rotation.rb'

class TestStringRotation < Minitest::Test
  def test_rotation
    str1 = 'waterbottle'
    str2 = 'erbottlewat'
    assert rotation?(str1, str2)
  end

  def test_not_rotation
    str1 = 'waterbottle'
    str2 = 'xrbottlewat'
    assert rotation?(str1, str2) == false
  end
end
