# If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?


# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.

def hund_thou_hash
  {
  1000  => "thousand",
  100   => "hundred"
  }
end

def tens_hash
  {
  90 => "ninety",
  80 => "eighty",
  70 => "seventy",
  60 => "sixty",
  50 => "fifty",
  40 => "forty",
  30 => "thirty",
  20 => "twenty",
  13 => "thirteen",
  12 => "twelve",
  11 => "eleven",
  10 => "ten"
  }
end

def ones_hash
  {
  9 => "nine",
  8 => "eight",
  7 => "seven",
  6 => "six",
  5 => "five",
  4 => "four",
  3 => "three",
  2 => "two",
  1 => "one"
  }
end

def hund_thou_word(number)
  word_string = ""
  hund_thou_hash.each do |key,value|
    if number / key != 0
      word_string += ones_hash[number/key] + value
      number %= key
    end
  end
  [word_string, number]
end

def tens_word(number)
  word_string = ""
  tens_hash.each do |key, value|
    if (14..19).include?(number)
      word_string += (number == 18 || number == 15 ? ones_hash[number-10] + "een" : ones_hash[number-10] + "teen")
      number = 0
      break
    elsif number / key != 0
      word_string += value
      word_string += ones_hash[number%key] if ones_hash[number%key]
      number = 0
      break
    end
  end
  [word_string, number]
end

def num_to_s(number)
  word_string = ""
  if number < 10
    word_string += ones_hash[number]
  elsif number < 100
    word_string += tens_word(number)[0]
  else
    hund_thou = hund_thou_word(number)
    word_string += hund_thou[0]
    if hund_thou[1] != 0 && hund_thou[1] < 10
      word_string += "and" + ones_hash[hund_thou[1]]
    elsif hund_thou[1] != 0
      tens = tens_word(hund_thou[1])
      word_string += "and" + tens[0]
    end
  end
  word_string
end

def all_nums_to_s(range)
  word_string = ""
  range.each {|x| word_string += num_to_s(x)}
  word_string.length
end

p all_nums_to_s(1..1000)