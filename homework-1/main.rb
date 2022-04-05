def greeting(name, surname, age)
  if age < 18
    "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано."
  else 
    "Привет, #{name} #{surname}. Самое время заняться делом!"
  end
end

def foobar(num_1, num_2)
  num_1 == 20 || num_2 == 20 ? num_2 : num_1 + num_2
end

# print ("Enter your name: ")
# name = gets.chomp
# print ("Enter your surname: ")
# surname= gets.chomp
# print ("How old are you? ")
# age = gets.to_i

# puts greeting(name, surname, age)

# print ("Enter 1st number: ")
# num_1 = gets.to_i
# print ("Enter 2nd number: ")
# num_2 = gets.to_i

# puts foobar(num_1, num_2)
