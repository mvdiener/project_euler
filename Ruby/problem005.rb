# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

# lcm(a,b) = |a*b|/gcd(a,b)

def prime_factors(number, array=[])
  2.upto(number) do |factor|
    if number % factor == 0
      array << factor
      number /= factor
      prime_factors(number, array)
      break
    end
  end
  array
end

def lowest_common_multi(range)
  lcm = 1
  count_hash = {}
  range.each do |num|
    all_factors = prime_factors(num)
    all_factors.each do |factor|
      if count_hash[factor]
        count_hash[factor] = all_factors.count(factor) if all_factors.count(factor) > count_hash[factor]
      else
        count_hash[factor] = all_factors.count(factor)
      end
    end
  end
  count_hash.each_key{|key| lcm *= (key**count_hash[key])}
  lcm
end

p lowest_common_multi(1..20)
