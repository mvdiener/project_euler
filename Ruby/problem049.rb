# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.

# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.

# What 12-digit number do you form by concatenating the three terms in this sequence?

def is_prime?(number)
  is_prime = true
  2.upto(Math.sqrt(number).floor) do |num|
    if number % num == 0
      is_prime = false
      break
    end
  end
  is_prime
end

def check_added_prime(num)
  is_prime?(num) && is_prime?(num+3330) && is_prime?(num+6660)
end

def num_to_s(num)
  num.to_s.split('').sort
end

def check_permutations(num)
  num_to_s(num) == num_to_s(num+3330) && num_to_s(num) == num_to_s(num+6660)
end

def weird_primes
  primes_concat = []
  (1001..6669).step(2) do |num|
    if check_added_prime(num) && check_permutations(num)
      primes_concat << (num.to_s + (num+3330).to_s + (num+6660).to_s).to_i
    end
  end
  primes_concat.last
end

p weird_primes