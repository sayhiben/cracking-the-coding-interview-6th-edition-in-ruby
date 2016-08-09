require 'test_helper.rb'
require './lib/util/linked_list.rb'
require './lib/chapter_2/2_1_remove_dups.rb'

class TestRemoveDups < Minitest::Test
  include Util

  def setup
    @data = %w(a a b c a d d e f g g)
    @list = LinkedList.new
    @data.each { |val| @list.append(val) }
  end

  def test_remove_dups
    remove_dups(@list.head)
    assert_equal @data.uniq, @list.to_a
  end

  def test_remove_dups_alt
    remove_dups_alt(@list.head)
    assert_equal @data.uniq, @list.to_a
  end
end
