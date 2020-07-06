# En suivant ce kata, fais un programme qui suit la philosophie du fils de Will Smith : capitaliser tous les mots d'une phrase.
class String
  def toJadenCase
    split(" ").map{|i| i.capitalize}.join(" ")
  end
end