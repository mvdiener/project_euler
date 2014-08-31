# Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0,
# where each “_” is a single digit.

(Math.sqrt(1020304050607080900).floor).upto(Math.sqrt(1929394959697989990).floor) do |number|
	puts number
	if number**2 =~ /[1]\d[2]\d[3]\d[4]\d[5]\d[6]\d[7]\d[8]\d[9]\d[0]/
		p number
		break
	end
end