# The decimal number, 585 = 1001001001 v2 (binary), is palindromic in both bases.

# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

# (Please note that the palindromic number, in either base, may not include leading zeros.)

def check_palindrome(string)
  return false if string[0] == '0'
  string == string.reverse
end

def check_both_bases(num)
  check_palindrome(num.to_s) && check_palindrome(num.to_s(2))
end

def palindromic_numbers(limit)
  palindrome_array = []
  (1...limit).each do |num|
    palindrome_array << num if check_both_bases(num)
  end
  palindrome_array.inject(:+)
end

p palindromic_numbers(1000000)
