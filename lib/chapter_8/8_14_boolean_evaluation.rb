# 8.14 Boolean Evaluation
# Given a boolean expression consisting of the symbols 0, 1, &, |, and ^m and a
#   desired boolean result value "result", implement a function to count the
#   number of ways of parenthesizing the expression such that it evaluates to
#   "result."
#

def count_eval(str, result)
  return 0 if str.length == 0
  return ((str == '1') == result ? 1 : 0) if str.length == 1
  count = 0
  str.chars.each_with_index do |char, i|
    if %w(^ | &).include?(char)
      left = str[0..i - 1]
      right = str[i + 1..str.length]

      left_true = count_eval(left, true)
      left_false = count_eval(left, false)
      right_true = count_eval(right, true)
      right_false = count_eval(right, false)

      total_combinations = (left_true + left_false) * (right_true + right_false)
      total_true = case char
                   when '^'
                     left_true * right_false +
                     left_false * right_true
                   when '|'
                     left_true * right_true +
                     left_false * right_true +
                     left_true * right_false
                   when '&'
                     left_true * right_true
                   end
      count += result ? total_true : total_combinations - total_true
    end
  end
  count
end
