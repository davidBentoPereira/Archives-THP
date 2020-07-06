# En suivant ce kata, fais un programme qui va prendre chaque chiffre d'un nombre, et le mettre au carré.
def square_digits num
  num.to_s.scan(/./).map {|e| e.to_i * e.to_i }.join.to_i
end