# En suivant ce kata, tu fais faire un programme qui va retirer d'une liste les oeuvres les moins bien notées.
def remove_smallest(numbers)
  return numbers if numbers.empty?
  new_numbers = numbers.dup
  new_numbers.delete_at(new_numbers.index(new_numbers.min))
  new_numbers
end
