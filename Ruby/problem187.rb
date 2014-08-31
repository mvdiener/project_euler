# A composite is a number containing at least two prime factors. For example, 15 = 3 × 5; 9 = 3 × 3; 12 = 2 × 2 × 3.

# There are ten composites below thirty containing precisely two, not necessarily distinct, prime factors: 4, 6, 9, 10, 14, 15, 21, 22, 25, 26.

# How many composite integers, n < 10^8, have precisely two, not necessarily distinct, prime factors?


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

def distinct_prime_factors(limit)
	distinct_prime_array = []
	4.upto(limit) do |number|
		p number
		if prime_factors(number).length == 2
			distinct_prime_array << number
		end
	end
	distinct_prime_array
end

p distinct_prime_factors(10**8).length