# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

number = 20
found = true

while found
	20.downto(11) do |multiple|
		# p number
		if multiple == 1
			found = false
			break
		elsif number % multiple == 0
			next
		elsif number % multiple != 0
			number += 20
			break
		end
	end
end

p number