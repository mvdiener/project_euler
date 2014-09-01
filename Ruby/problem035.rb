# The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

# How many circular primes are there below one million?

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

# using the Sieve of Eratosthenes
def find_primes(limit)
  num_array = (2...limit).to_a
  num_array.each_with_index do |val, index|
    if val
      index += val
      while index < limit-2
        num_array[index] = nil
        index += val
      end
    else
      next
    end
  end
  num_array.compact
end

def rotate_number(number)
  number.to_s.split('').rotate.join('').to_i
end

def is_circular_prime?(prime)
  rotate_count = prime.to_s.length - 1
  return false if prime.to_s.split('').include?('2') && rotate_count > 0
  rotated = rotate_number(prime)
  all_prime = true
  rotate_count.times do
    if rotated.to_s.length != prime.to_s.length
      all_prime = false
      break
    elsif is_prime?(rotated)
      rotated = rotate_number(rotated)
    else
      all_prime = false
      break
    end
  end
  all_prime
end

def rotated_primes(array)
  array.select{ |prime| is_circular_prime?(prime) }.length
end

primes_array = find_primes(1000000)
p rotated_primes(primes_array)