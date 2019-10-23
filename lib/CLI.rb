class CommandLineInterface

    def initialize
        @athlete = nil
        @prompt = TTY::Prompt.new
    end
    #method greet puts a welcome string then asks for user input and uses .chomp to remove newline. 
    #Then input is saved using variable and a new Athlete class instance is initialized
    #The input is then saved in the database as a hash

    def greet

        input = @prompt.select("Welcome to MYBOX! Please enter your details to login or sign up and book your personal training session.", %w(sign_up login))
        
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
            @athlete = Athlete.create_athlete(@first_name, @last_name, age, @email) 
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
        menu
    end

    def successful_register 
        puts "You have sucessfuly registered #{@athlete.first_name}!"
        menu
    end
        

    def pt_book
        choose_day

        #PTSession.where(athlete_id: 

    end 

    def choose_day 
        puts "Let's book your PT session! please indicate your preffered day"
        #puts "Day:"
        #day = gets.chomp
        @day_input = @prompt.select("Day:", %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday))
        puts "Here are all our available sessions on #{@day_input}:"
        @chosen_session = PTSession.where(day: @day_input, athlete_id: 1)
        tp @chosen_session, "day", "time", "duration"
        book_time
    end

    def book_time
        puts "Please specify your desired time slot"
        @time_slot = @prompt.select("Time:", @chosen_session.map {|session| session.time })
        
        # binding.pry 

        #time_slot = gets.chomp
        # @time_slot = @prompt.select("Day:") do |menu|
        #     menu.choice '08:00'
        #     menu.choice '12:00'
        #     menu.choice '17:00'
        # end
            
        @chosen_session = PTSession.where(day: @day_input,time: @time_slot)
        #where return an array with the instance whereas find_by returns the instance by itself
        athlete = Athlete.find_by_email(@athlete)
        session_coach = @chosen_session.pluck(:coach_id)
        #binding.pry
        session_coach = session_coach[0]
        session_coach = Coach.find(session_coach).first_name
        @chosen_session.update athlete: @athlete
        puts "Great! you're booked for your PT session at #{@time_slot} on #{@day_input} with coach #{session_coach}"
        #binding.pry
        menu
    end

    def update_session
        puts "Please select another session time if you can't make your original booking"
        puts "Original booking:"
        tp @booking, "day", "time", "duration"
        puts  "Other availabilities:"
        @chosen_session = PTSession.where(day: @day_input, athlete_id: 1)
        @time_slot = @prompt.select("Time:", @chosen_session.map {|session| session.time })
        #@chosen_session.update athlete_id: 1
        #davecastro@gmail.com
        #@chosen_session not defined because when update session chosen in menu it skips choose day method and chosen_session remains undefined.


    end

    def logout?
        logout = @prompt.select("Would you like to go back to menu, logout or exit?") do |menu|
            menu.choice 'Menu'
            menu.choice 'Logout'
            menu.choice 'Exit'
        end

            if logout == "Menu"
                menu
            elsif logout == 'Logout'
                @athlete = nil
                #binding.pry
                #return "You have been logged out"
                puts "You have been logged out"
                greet
            else 
                return
            end
    end 

    #def book_success
    # athlete = Athlete.find_by_email(@email)
    #binding.pry
    #@chosen_session.update athlete: athlete
    #puts "Great! you're booked for your PT session at #{time_slot} on #{day} with coach #{Coach.all.sample.first_name}"
    #end

    def show_sessions
        @booking = PTSession.find_by(athlete_id: @athlete.id)
        if  @booking != nil
            puts "Here are your scheduled sessions:"
            tp @booking, "day", "time", "duration"

            @selection = @prompt.select("Would you like to change, cancel a session, go back to menu or logout?") do |menu|
                menu.choice "Change a session"
                menu.choice "Cancel a session"
                menu.choice "Menu"
                menu.choice "Logout"
            end

            if @selection == "Change a session"
                update_session
            elsif @selection == "Cancel a session"
                #@chosen_session = PTSession.where(day: @day_input, athlete_id: 1)
                cancel_session
            elsif @selection == "Menu"
                menu 
            elsif @selection == "Logout"
                logout?
            end

        else
            puts "Sorry, looks like your schedule is empty"
            selection = @prompt.select("Would you like to book a session?") do |menu|
                menu.choice "Yes!"
                menu.choice "No"
            end

            if selection == "Yes!"
                pt_book
            else 
                return
            end
            end
    end

    # def session_selection
    #     if @selection == "Change a session"
    #         change a session
    #     elsif @selection == "Cancel a session"
    #         cancel_session
    #     elsif @selection == "Menu"
    #         menu
    #     elsif @selection == "Logout"
    #         logout
    #     end

    # end

    

    def cancel_session
    end 


    def menu
        menu_selection = @prompt.select("Menu:") do |menu|
            menu.choice "Book a session"
            menu.choice "View scheduled for this week"
            menu.choice "Logout"
           
        end

        if menu_selection == "Book a session"
            pt_book
        elsif menu_selection == "Logout"
            logout?
        else 
            show_sessions
        end

        #binding.pry
    end

end



#If registered then do not log in datatbase 
#time slot selecting does not get removed once session is booked 
# no coach association to booking in database
#create method for menu to select CRUD
#method to lookup booked PT in db then be able to select via menu to update or delete
#create update and delete method for menu
#logout + @athlete = nil and redirect to greet
#refactor chunky if statements like in greet
#database calls (using where/activerec) should be in Class like PTSession

