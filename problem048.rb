# The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

# Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

p (1..1000).inject{|sum, num| sum + num**num}.to_s.split('')[-10..-1].join.to_i