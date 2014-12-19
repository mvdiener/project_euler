# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

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

p prime_factors(600851475143).last


# 100

# 2..100

# 100/2

# [2], 50

# 50

# 2..50

# [2,2], 25

# 25

# [2,2,5], 5

[2,2,5,5], 1
