class CommandLineInterface

#method greet puts a welcome string then asks for user input and uses .chomp to remove newline. 
#Then input is saved using variable and a new Athlete class instance is initialized
#The input is then saved in the database as a hash
def greet

    puts 'Welcome to MYBOX! Please enter your details to login and book your personal training session.'
    
    puts 'name:'
    name = gets.chomp
    full_name = name.split
    first_name = full_name[0]
    last_name = full_name[1]
    #athlete_first_name = Athlete.new(:first_name => first_name)
    #athlete_last_name = Athlete.new(:last_name => last_name)
    #athlete_first_name.save
    #athlete_last_name.save

    puts 'age:'
    age = gets.chomp

    
    puts 'email:'
    email = gets.chomp


    new_athlete = Athlete.create(first_name: first_name, last_name: last_name, age: age, email: email)
  end

end
