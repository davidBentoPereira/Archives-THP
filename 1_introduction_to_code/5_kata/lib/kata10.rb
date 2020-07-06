# En suivant ce kata, fais un programme qui arrive à détecter le statut d'un joueur de ton association locale de cricket.
def openOrSenior(data)
  result = []

  data.each do |i|
    if i[0] >= 55 and i[1] > 7
      result.push("Senior")
    else
      result.push("Open")
    end
  end
  return result
end