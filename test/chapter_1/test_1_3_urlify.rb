require 'test_helper.rb'
require './lib/chapter_1/1_3_urlify.rb'

class TestUrlify < Minitest::Test
  def test_urlify_success
    str = 'Mr John Smith    '
    assert_equal 'Mr%20John%20Smith', urlify(str, 13)
  end

  def test_urlify_all_spaces
    str = '      '
    assert_equal '%20%20', urlify(str, 2)
  end

  def test_urlify_no_spaces
    str = 'nospaces'
    assert_equal str, urlify(str, 8)
  end

  def test_urlify_leading_spaces
    str = '  spaces    '
    assert_equal '%20%20spaces', urlify(str, 8)
  end
end
