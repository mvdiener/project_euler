# Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13

# It can be verified that the sum of the numbers on the diagonals is 101.

# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

def make_spiral(limit)
  (1..(limit**2)).to_a
end

def sum_diagonals(limit)
  array = make_spiral(limit)
  gap = 2
  index = 0
  sum = 0
  while index < array.length
    4.times do
      break if index > array.length
      sum += array[index]
      index += gap
    end
    gap += 2
  end
  sum
end

p sum_diagonals(1001)