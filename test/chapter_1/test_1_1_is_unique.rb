require 'test_helper.rb'
require './lib/chapter_1/1_1_is_unique.rb'

class TestIsUnique < Minitest::Test
  def test_string_has_unique_characters
    str = 'qwertyuiop1234567890'
    assert unique?(str)
  end

  def test_string_has_duplicate_characters
    str = 'qwertyuiopqwertyuiop'
    assert unique?(str) == false
  end

  def test_string_has_unique_characters_without_set
    str = 'qwertyuiop1234567890'
    assert unique_without_set?(str)
  end

  def test_string_has_duplicate_characters_without_set
    str = 'qwertyuiopqwertyuiop'
    assert unique_without_set?(str) == false
  end
end
