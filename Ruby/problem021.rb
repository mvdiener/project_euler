# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

# Evaluate the sum of all the amicable numbers under 10000.

def proper_divisor_sum(num)
  (1..num/2).select{|x| num % x == 0}.inject(:+)
end

def amicable_numbers(limit)
  divisor_hash = {}
  amicable_numbers = []
  (2...limit).each do |number|
    sum = proper_divisor_sum(number)
    divisor_hash[number] = sum
    if divisor_hash[sum] == number && number != sum
      amicable_numbers.push(number, sum)
    end
  end
  amicable_numbers.inject(:+)
end

p amicable_numbers(10000)