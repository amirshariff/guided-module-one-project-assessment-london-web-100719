class CommandLineInterface

    require 'pry'
    require "tty-prompt"

#method greet puts a welcome string then asks for user input and uses .chomp to remove newline. 
#Then input is saved using variable and a new Athlete class instance is initialized
#The input is then saved in the database as a hash

def greet
    prompt = TTY::Prompt.new

   input = prompt.select("Welcome to MYBOX! Please enter your details to login or sign up and book your personal training session.", %w(sign_up login))
    
    if  input == "sign_up"
        puts 'Full Name:'
        name = gets.chomp
        full_name = name.split
        first_name = full_name[0]
        last_name = full_name[1]
        @first_name = first_name
        @last_name = last_name
#gets full name input and chomps off new line. Then first name and last name are seperated by whitespace using split.
#First name and last name are 2 seperate elements in an array and they are respectively assaigned to variables 
        puts 'Age:'
        age = gets.chomp

        puts 'Email:'
        @email = gets.chomp
#instantiates a new athlete instance and provides name, age, email as arguments and saves it to the database
        @new_athlete = Athlete.create_athlete(@first_name, @last_name, age, @email) 
        successful_register

    else
        puts "Please provide your registered email:"
        athlete_email = gets.chomp
        @athlete = Athlete.find_by_email(athlete_email)

        if @athlete != nil
            successful_login
        else
            login_fail
        end
        #binding.pry
    end
end

def login_fail
    puts "Oops! looks like you put in the wrong email or are not registered with us."
            puts "Please try again or sign up"
            greet
end

    def successful_login
        puts "You have sucessfuly logged in #{@athlete.first_name}!"
    end

    def successful_register 
        puts "You have sucessfuly registered #{@new_athlete.first_name}!"
    end
    

  def pt_book
    choose_day

    #PTSession.where(athlete_id: 

   end 

   def choose_day 
    prompt = TTY::Prompt.new
    puts "Let's book your PT session! please indicate your preffered day"
    #puts "Day:"
    #day = gets.chomp
    @day_input = prompt.select("Day:", %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday))
    puts "Here are all our available sessions on #{@day_input}:"
    chosen_session = PTSession.where(day: @day_input, athlete_id: 1)
    tp chosen_session, "day", "time", "duration"
    book_time
   end

   def book_time
    prompt = TTY::Prompt.new
    puts "Please specify your desired time slot"
    #time_slot = gets.chomp
    time_slot = prompt.select("Day:") do |menu|
        menu.choice '08:00'
        menu.choice '12:00'
        menu.choice '17:00'
    end
        
    chosen_session = PTSession.where(day: @day_input,time: time_slot)
    athlete = Athlete.find_by_email(@athlete)
    #binding.pry
    chosen_session.update athlete: @athlete
    puts "Great! you're booked for your PT session at #{time_slot} on #{@day_input} with coach #{Coach.all.sample.first_name}"
   end


   #def book_success
   # athlete = Athlete.find_by_email(@email)
    #binding.pry
    #@chosen_session.update athlete: athlete
    #puts "Great! you're booked for your PT session at #{time_slot} on #{day} with coach #{Coach.all.sample.first_name}"
   #end

end



#If registered then do not log in datatbase 
# fix time formating
# fix PT avaialbilities
# fix capitalization of day
#time slot selectin does not get removed once session is booked 
# no coach association to booking in database
#athlete id = nil when session booked
