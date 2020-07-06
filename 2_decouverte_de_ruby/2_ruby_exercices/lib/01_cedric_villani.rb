def sum_of_3_or_5_multiples(final_number)
  if final_number.class != Integer || final_number < 0
    return 'Error: an Integer is required'
  end

  final_sum = i = 0

  while i < final_number
    if is_multiple_of_3_or_5?(i) {}
      final_sum += i
    end
    i += 1
  end

  final_sum
end

def is_multiple_of_3_or_5?(n)
  n % 3 === 0 || n % 5 === 0 ? true: false
end