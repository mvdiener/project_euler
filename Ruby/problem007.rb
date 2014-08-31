# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

# What is the 10001st prime number?

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

def nth_prime(number)
	prime_array = []
	counter = 2
	while prime_array.length < number do
		prime_array << counter if is_prime?(counter)
		counter += 1
	end
	prime_array.last
end

p nth_prime(10001)