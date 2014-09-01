# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

number_found = []

999.downto(950) do |first_num|
  999.downto(100) do |second_num|
    product = first_num * second_num
    if product.to_s.split('') == product.to_s.split('').reverse
      number_found << product
    end
  end
end

p number_found.sort.last

