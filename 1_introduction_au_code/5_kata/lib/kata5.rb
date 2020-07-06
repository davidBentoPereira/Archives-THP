# En suivant ce kata, fais un programme qui permet d'annihiler les trolls d'un site en effaçant les voyelles de leurs phrases.
def disemvowel(str)
  str.delete('aeiouAEIOU')
end