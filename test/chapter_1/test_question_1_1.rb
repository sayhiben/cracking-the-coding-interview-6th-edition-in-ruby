require 'test_helper.rb'
require './lib/chapter_1/question_1_1.rb'

class TestQuestion_1_1 < Minitest::Test
  def test_string_has_unique_characters
    str = 'qwertyuiop1234567890'
    assert is_unique?(str)
  end

  def test_string_has_duplicate_characters
    str = 'qwertyuiopqwertyuiop'
    assert !is_unique?(str)
  end

  def test_string_has_unique_characters_without_set
    str = 'qwertyuiop1234567890'
    assert is_unique_without_set?(str)
  end

  def test_string_has_duplicate_characters_without_set
    str = 'qwertyuiopqwertyuiop'
    assert !is_unique_without_set?(str)
  end
end
