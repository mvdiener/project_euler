# Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

# 1634 = 14 + 64 + 34 + 44
# 8208 = 84 + 24 + 04 + 84
# 9474 = 94 + 44 + 74 + 44
# As 1 = 14 is not a sum it is not included.

# The sum of these numbers is 1634 + 8208 + 9474 = 19316.

# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

def fifth_power_product(number)
  number.to_s.split('').map{|x| x.to_i ** 5}.inject(:+)
end

def check_numbers(limit)
  fifth_power_array = []
  (1000..limit).each do |num|
    fifth_power_array << num if num == fifth_power_product(num)
  end
  fifth_power_array.inject(:+)
end

p check_numbers(200000)