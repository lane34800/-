# Get a word and translate it to Pig Latin. Takes one argument:
# **string: Accept a string to be translated.

def pig_latin_word(string)
  array_of_char = string.downcase.split(//)

  if ["a","e","i","o","u","y"].include?(array_of_char[0])
    array_of_char.push("ay")
  elsif !(["a","e","i","o","u","y"].include?(array_of_char[0]))
    consonant = array_of_char.delete_at(0)
    array_of_char.push(consonant, "ay")
  end

  return array_of_char.join

end


# Get a sentence and translate it to Pig Latin using +++
# the method pig_latin_word. Takes one argument:
# **string: Accept a string to be translated.

def pig_latin_sentence(string)
  array_of_word = string.split(" ")
  new_array_of_word = []

  array_of_word.each do |word|
    new_array_of_word.push(pig_latin_word(word))
  end

  return new_array_of_word.join(" ")

end