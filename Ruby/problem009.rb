# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

# 2mn
# m**2 − n**2
# m**2 + n**2

def find_triple(m, n)
  a = m**2 - n**2
  b = 2*m*n
  c = m**2 + n**2
  [a,b,c]
end

def generate_possibilities
  m = 2
  n = 1
  until find_triple(m, n).inject(:+) == 1000 do
    if find_triple(m, n).inject(:+) > 1000
      n += 1
      m = n + 1
    else
      m += 1
    end
  end
  find_triple(m, n).inject(:*)
end

p generate_possibilities