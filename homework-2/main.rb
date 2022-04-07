def check_word(word)  
  word[-2..-1] == "CS" ? (p (2 ** word.length)) : (p (word.reverse))
end
  
def create_pokemons_array(number_of_pokemons)
  pokemons = []

  number_of_pokemons.times do
    print ("Enter name of pokemon ")
    name = gets.chomp
    print ("Enter color of pokemon ")
    color = gets.chomp
    pokemons << { name => color }
  end

  pokemons
end
  
#   print ("Enter random word: ")
#   word = gets.chomp
#   puts check_word(word)
  
#   print ("How many pokemons create? ")
#   number_of_pokemons = gets.to_i
  
#   puts create_pokemons_array(number_of_pokemons)