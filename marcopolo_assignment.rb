
def marcopolo(num)
result = []
	for n in 1..num
		result << check_number_for_marcopolo(n)
	end
	p result
end

# function checking where the number is marco,polo or marcopolo
def check_number_for_marcopolo(num)
	return result = "marcopolo"  if num % 4 == 0 and num % 7 == 0 
	return result = "marco"  if num % 4 == 0
	return result = "polo"  if num % 7 == 0
	return num
end

marcopolo 100