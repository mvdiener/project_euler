# By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

# 3
# 7 4
# 2 4 6
# 8 5 9 3

# That is, 3 + 7 + 4 + 9 = 23.

# Find the maximum total from top to bottom in triangle.txt (right click and 'Save Link/Target As...'), a 15K text file containing a triangle with one-hundred rows.

require_relative 'problem067triangle'

triangle = @triangle

def triangle_sum(array)
  1.upto(array.length-1) do |row|
    array[row].each_with_index do |num, index|
      parent1 = array[row-1][index-1] || -1
      parent2 = array[row-1][index] || -1
      parent1 > parent2 ? array[row][index] += parent1 : array[row][index] += parent2
    end
  end
  array.last.max
end

p triangle_sum(triangle)