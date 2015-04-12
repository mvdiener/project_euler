# The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first ten triangle numbers are:

# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall call the word a triangle word.

# Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?

require_relative 'problem042words.rb'

def get_word_sum(word)
  word.split('').map{|x| x.ord-64}.inject(:+)
end

def check_triangle_number?(number)
  computed = Math.sqrt(number*8+1)
  computed.floor == computed
end

def read_file(array)
  counter = 0
  array.each do |word|
    sum = get_word_sum(word)
    counter += 1 if check_triangle_number?(sum)
  end
  counter
end

puts read_file(@words)