# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

# For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

# What is the total of all the name scores in the file?

require_relative 'problem022names.rb'

names = @names.sort

def score_of_name(string, index)
  ords = string.split('').map{|letter| letter.ord%64}
  ords.inject(:+) * index
end

def sum_of_scores(array)
  array.map.with_index{|name, index| score_of_name(name, index+1)}.inject(:+)
end

p sum_of_scores(names)