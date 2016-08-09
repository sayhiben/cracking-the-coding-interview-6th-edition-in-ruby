require 'test_helper.rb'
require './lib/util/linked_list.rb'
require './lib/chapter_2/2_6_palindrome.rb'

class TestPalindrome < Minitest::Test
  include Util

  def setup
    @list1 = LinkedList.new
  end

  def populate_list(list, data)
    data.each { |val| list.append(val) }
  end

  def test_palindrome_odd
    data = %w(r e n o l o n e r)
    populate_list(@list1, data)
    assert palindrome?(@list1.head)
  end

  def test_palindrome_even
    data = %w(s a a s)
    populate_list(@list1, data)
    assert palindrome?(@list1.head)
  end

  def test_not_palindrome
    data = %w(x e n o l o n e r)
    populate_list(@list1, data)
    assert palindrome?(@list1.head) == false
  end
end
