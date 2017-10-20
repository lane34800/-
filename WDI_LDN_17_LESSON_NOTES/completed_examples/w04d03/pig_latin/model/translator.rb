

class Translator                                         #Translator Class

  
  def self.translate word                                 #Translator ClassMethod  

    vowels = ["a", "e", "i", "o", "u"]                    #create an array of vowels
    word.downcase!                                        #put the word to downcase

    
    if vowels.include? word[0]                            #if the first letter of the word contains a vowel
      word << "ay"                                          #add 'ay' to the end of the string
    else
      word << word[0]                                       #add the first letter to the end of the string
      word << "ay"                                          #add 'ay' to the end of the string 
      word[0] = ""                                          #delete the first letter of the string
    end
    word                                                  #return word
  end



  def self.toGerman word

      #translation logic 

  end


end