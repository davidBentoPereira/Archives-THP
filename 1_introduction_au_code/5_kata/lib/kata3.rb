# En suivant ce kata, fais un programme sortant le caractère dun milieu d'un string donné.
def get_middle(s)
  str_middle = s.length / 2

  if s.length % 2 === 0
    return s[str_middle - 1] + s[str_middle]
  else
    return s[str_middle]
  end
end