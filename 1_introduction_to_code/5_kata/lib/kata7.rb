# En suivant ce kata, fais un programme qui te sort le plus petit mot d'une phrase.
def find_short(s)
  l = s.split(" ").sort_by(&:length)[0].length
  return l # l: length of the shortest word
end