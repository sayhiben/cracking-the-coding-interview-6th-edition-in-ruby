require 'test_helper.rb'
require './lib/chapter_4/4_7_build_order.rb'

class TestBuildOrder < Minitest::Test
  def setup
    @projects = ('a'..'f').to_a
    @dependencies = [
      %w(a d),
      %w(f b),
      %w(b d),
      %w(f a),
      %w(d c)
    ]
  end

  def test_build_order
    sorter = DependencySorter.new(@projects, @dependencies)
    assert_equal %w(f e b a d c), sorter.sort
  end

  def test_has_cycle
    @dependencies << %w(d f)
    sorter = DependencySorter.new(@projects, @dependencies)
    assert_raises ArgumentError do
      sorter.sort
    end
  end
end
