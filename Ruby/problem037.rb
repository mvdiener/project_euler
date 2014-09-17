# The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.

# Find the sum of the only eleven primes that are both truncatable from left to right and right to left.

# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

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
  num_array
end

def truncate_string_right(string, prime_array)
  check = true
  n = string.length - 1
  while n >= 0
    break if check == false
    check = false unless prime_array[string[0..n].to_i-2] == string[0..n].to_i
    n -= 1
  end
  check
end

def truncate_string_left(string, prime_array)
  check = true
  n = string.length - 1
  i = 0
  while i <= n
    break if check == false
    check = false unless prime_array[string[i..n].to_i-2] == string[i..n].to_i
    i += 1
  end
  check
end

def truncatable
  valid_starts_ends = ['3','7']
  prime_array = find_primes(1000000)
  prime_array.compact[4..-1].select do |prime|
    prime_s = prime.to_s
    next unless prime_s.length < 3 || valid_starts_ends.include?(prime_s[0] && prime_s[-1])
    next if prime_s.length >= 3 && prime_s.include?('0' || '2' || '4' || '6' || '8')
    truncate_string_left(prime_s, prime_array) && truncate_string_right(prime_s, prime_array)
  end
end

p truncatable.inject(:+)
