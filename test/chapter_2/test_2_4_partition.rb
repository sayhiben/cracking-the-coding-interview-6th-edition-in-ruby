require 'test_helper.rb'
require './lib/util/linked_list.rb'
require './lib/chapter_2/2_4_partition.rb'

class TestPartition < Minitest::Test
  include Util

  def setup
    @data = [11, 3, 5, 8, 5, 10, 2, 1]
    @list = LinkedList.new
    @data.each { |val| @list.append(val) }
  end

  def test_partition
    result = partition(@list.head, 5)
    before_partition = true
    until result.nil?
      before_partition = false if before_partition == true && result.data >= 5
      if before_partition
        assert result.data < 5
      else
        assert result.data >= 5
      end
      result = result.next
    end
  end

end
