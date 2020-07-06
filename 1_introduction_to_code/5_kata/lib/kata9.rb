# En suivant ce kata, tu vas faire un programme qui cache tous les éléments d'un string sauf les quatre derniers.
def maskify(cc)
  "#"*(cc.length-4) + cc[-4..cc.length]
end