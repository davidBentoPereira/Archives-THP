# En suivant ce kata, fais un programme qui enlève tous les éléments d'une array qui ne sont pas un integer.
def filter_list(l)
  l.grep(Integer)
end