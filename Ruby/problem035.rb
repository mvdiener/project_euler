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

def find_primes(limit)
	primes_array = []
	(2...limit).each do |x|
		primes_array << x if is_prime?(x)
	end
	primes_array
end

def rotate_number(number)
	number.to_s.split('').rotate.join('').to_i
end

def is_circular_prime?(prime)
	rotate_count = prime.to_s.length - 1
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
	rotated_array = []
	array.each do |prime|
		rotated_array << prime if is_circular_prime?(prime)
	end
	rotated_array.length
end

primes_array = find_primes(1000000)
p rotated_primes(primes_array)