def echo(str)
  str
end

def shout(str)
  str.upcase
end

def repeat(str, repeat = 2)
  ((str + " ")*repeat).strip
end

def start_of_word(str, length = 1)
  str[0..length - 1]
end

def first_word(str)
  str.split(" ")[0]
end

def titleize(str)
  str.capitalize!  # capitalize the first word in case it is part of the no words array
  words_no_cap = ["and", "or", "the", "to", "the", "a", "but"]
  phrase = str.split(" ").map {|word|
    if words_no_cap.include?(word)
      word
    else
      word.capitalize
    end
  }.join(" ")
end