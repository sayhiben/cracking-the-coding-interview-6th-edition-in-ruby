require 'test_helper.rb'
require './lib/chapter_8/8_11_coins.rb'

class TestCoins < Minitest::Test
  def test_coins
    assert_equal 18, CoinCombiner.new.coin_combos(30)
  end
end
