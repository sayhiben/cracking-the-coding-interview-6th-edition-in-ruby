require 'test_helper.rb'
require './lib/chapter_1/1_6_string_compression.rb'

class TestStringCompression < Minitest::Test
  def test_compress
    str = 'aabcccccaaa'
    assert_equal 'a2b1c5a3', compress(str)
  end

  def test_original_is_shorter
    str = 'qwertyuiop'
    assert_equal str, compress(str)
  end
end
