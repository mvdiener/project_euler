# The following iterative sequence is defined for the set of positive integers:

# n → n/2 (n is even)
# n → 3n + 1 (n is odd)

# Using the rule above and starting with 13, we generate the following sequence:

# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?

# NOTE: Once the chain starts the terms are allowed to go above one million.


def chain(number, collatz_hash)
  return collatz_hash[number] if collatz_hash[number]
  if number.even?
    collatz_hash[number] = 1 + chain(number/2, collatz_hash)
  elsif number.odd?
    collatz_hash[number] = 1 + chain((3*number + 1), collatz_hash)
  end
end

def longest_chain(limit)
  chain_number = 0
  chain_length = 0
  collatz_hash = {1 => 1}
  2.upto(limit) do |num|
    collatz_hash[num] = chain(num, collatz_hash)
    if collatz_hash[num] > chain_length
      chain_length = collatz_hash[num]
      chain_number = num
    end
  end
  chain_number
end

p longest_chain(1000000)