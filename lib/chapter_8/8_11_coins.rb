# 8.11 Coins
# Given an infinite number of quarters, dimes, nickels, and pennies, write code
#   to calculate the number of ways of representing n cents
#

class CoinCombiner
  def initialize
    @denominations = [25, 10, 5, 1]
    @lookup = {
      0 => {},
      1 => {},
      2 => {},
      3 => {}
    }
  end

  def coin_combos(target, denom_index = 0)
    return @lookup[denom_index][target] if @lookup[denom_index].key?(target)
    return 1 if denom_index >= @denominations.length - 1
    denom_value = @denominations[denom_index]
    max_coins = target / denom_value
    count = 0
    (0..max_coins).each do |coin_count|
      remaining = target - coin_count * denom_value
      count += coin_combos(remaining, denom_index + 1)
    end
    @lookup[denom_index][target] = count
    count
  end
end
