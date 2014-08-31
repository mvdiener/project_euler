# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.

# def is_prime?(number)
# 	is_prime = true
# 	2.upto(Math.sqrt(number).floor) do |num|
# 		if number % num == 0
# 			is_prime = false
# 			break
# 		end
# 	end
# 	is_prime
# end

# def find_primes(limit)
# 	primes_array = []
# 	(2...limit).each do |x|
# 		primes_array << x if is_prime?(x)
# 	end
# 	primes_array
# end

# puts find_primes(2000000).inject(:+)

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
	num_array
end

p find_primes(2000000).compact.inject(:+)