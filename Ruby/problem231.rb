# The binomial coefficient 10C3 = 120.
# 120 = 2^3 × 3 × 5 = 2 × 2 × 2 × 3 × 5, and 2 + 2 + 2 + 3 + 5 = 14.
# So the sum of the terms in the prime factorisation of 10C3 is 14. 

# Find the sum of the terms in the prime factorisation of 20000000C15000000.

def large_factorial(n)
  (n**n) * ((Math::E)**(-n)) * (Math.sqrt(2*Math::PI*n)) * (1 + (1/(12*n)))
end

def binomial_coef(n, k)
  # k == 1 ? (n/k.to_f) : (n/k.to_f) * binomial_coef(n-1, k-1)
  large_factorial(n) / (large_factorial(k) * large_factorial(n-k))
end

# puts binomial_coef(20000000, 15000000)

# n! ~= n^n * e^-n * Math.sqrt(2*pi*n) * (1 + 1/(12*n))


# p large_factorial(20000000)

p 20000000**20000000