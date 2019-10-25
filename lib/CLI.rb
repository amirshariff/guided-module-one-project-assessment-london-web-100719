class CommandLineInterface

    def initialize
        @athlete = nil
        @prompt = TTY::Prompt.new
    end
    #method greet puts a welcome string then asks for user input and uses .chomp to remove newline. 
    #Then input is saved using variable and a new Athlete class instance is initialized
    #The input is then saved in the database as a hash

    def greet

        input = @prompt.select("Welcome to MYBOX! Please enter your details to login or sign up and book your personal training session.", ["Sign Up", "Login", "Delete Account", "Exit"])
        
        if  input == "Sign Up"
            register
        elsif input == "Login"
            login_greet
        elsif input == "Delete Account"
            delete_athlete
        else
            return    
        end
    end

    def register
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
        age = gets.chomp.to_i
        
        puts 'Email:'
        @email = gets.chomp
        #instantiates a new athlete instance and provides name, age, email as arguments and saves it to the database
        @athlete = Athlete.create_athlete(@first_name, @last_name, age, @email) 
        successful_register
        
    end

    def login_greet
        puts "Please provide your registered email:"
        athlete_email = gets.chomp
        @athlete = Athlete.find_email(athlete_email)
        verify
    end 

    def verify
        if @athlete != nil
            successful_login
        else
            login_fail
        end
    end

    def verify_delete
        puts "Please provide your registered email:"
        athlete_email = gets.chomp
        @athlete = Athlete.find_email(athlete_email)
        if  @athlete != nil
            puts "Account holder: #{@athlete.first_name}"
        else
            check_fail
            verify_delete
        end
    end



    def check_fail
        input = @prompt.select("Sorry, doesn't look like that email is registered with us. Would you like to try again or exit?", ["Try Again", "Exit"])
        if input == "Try Again"
            delete_athlete
        else
            greet
        end
    end


    def login_fail
        puts "Oops! looks like you put in the wrong email or are not registered with us."
        puts "Please try again or sign up"
        greet
    end

    def successful_login
        puts "You have sucessfuly logged in #{@athlete.first_name}!"
        main_menu
    end

    def successful_register 
        puts "You have sucessfuly registered #{@athlete.first_name}!"
        main_menu
    end

    def delete_athlete
        verify_delete
        input = @prompt.select("Are you sure you would like to delete your account?", ["Yes", "No"])

        if input == "Yes"
            @athlete.destroy
            puts "Your account has been deleted"
        end
        return 
    end 
        

    def pt_book
        puts "Let's book your PT session! please indicate your preffered day"
        choose_day
    end 

    def choose_day 
        @day_input = @prompt.select("Day:", %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday))
        @chosen_session = PTSession.find_availabilites_day(@day_input, 1)
            if @chosen_session[0] != nil
                puts "Here are all our available sessions on #{@day_input}:"
                tp @chosen_session, "day", "time", "duration"
                book_time

            elsif @chosen_session[0] == nil
        
                puts "Sorry, there are no more availble sessions on #{@day_input}"
                main_menu
            end
    end


    def book_time
        puts "Please specify your desired time slot"
        @time_slot = @prompt.select("Time:", @chosen_session.map {|session| session.time })
        @chosen_session = PTSession.find_availabilites_time(@day_input, @time_slot)
        #where return an array with the instance whereas find_by returns the instance by itself
        athlete = Athlete.find_email(@athlete)
        session_coach = @chosen_session.pluck(:coach_id)
        session_coach = session_coach[0]
        session_coach = Coach.find(session_coach).first_name
        @chosen_session.update athlete: @athlete
        puts "Great! you're booked for your PT session at #{@time_slot} on #{@day_input} with coach #{session_coach}"
        main_menu
    end


    def update_session
        if @booking[0] != nil
            puts "Please select another session time if you can't make your original booking"
            puts "Original booking:"
            tp @booking, "day", "time", "duration"
            puts "Which booking would you like to change?"
            booking = @booking.pluck(:day)
            times = @booking.map {|session| session.time}
            #binding.pry
            booking_input = @prompt.select("Day:", booking)
            booking = PTSession.find_booking(booking_input, @athlete.id)
            booking.update athlete_id: 1
            puts  "Other availabilities:"
            choose_day
        elsif @booking[0] == nil
            puts "Sorry, there are no bookings to change"
            main_menu 
        end
            #@chosen_session not defined because when update session chosen in menu it skips choose day method and chosen_session remains undefined.
    end

    def logout?
        logout = @prompt.select("Would you like to go back to menu, logout or exit?") do |menu|
            menu.choice 'Menu'
            menu.choice 'Logout'
            menu.choice 'Exit'
        end

            if logout == "Menu"
                main_menu
            elsif logout == 'Logout'
                @athlete = nil
                puts "You have been logged out"
                greet
            else 
                return
            end
    end 


    def session_menu
        @selection = @prompt.select("Would you like to change, cancel a session, go back to menu or logout?") do |menu|
            menu.choice "Change a session"
            menu.choice "Cancel a session"
            menu.choice "Menu"
            menu.choice "Logout"
        end

        if @selection == "Change a session"
            update_session
        elsif @selection == "Cancel a session"
            cancel_session
        elsif @selection == "Menu"
            main_menu 
        elsif @selection == "Logout"
            logout?
        end
    end

    def show_sessions
        @booking = PTSession.find_session(@athlete.id)
        if  @booking[0] != nil
            puts "Here are your scheduled sessions:"
            tp @booking, "day", "time", "duration"
            session_menu
#fix no data issue 
        else
            puts "Sorry, looks like your schedule is empty"
            selection = @prompt.select("Would you like to book a session?") do |menu|
                menu.choice "Yes!"
                menu.choice "No"
            end

            if selection == "Yes!"
                pt_book
            else 
                main_menu
            end
        end
    end



    def cancel_session
        #booking_inst = PTSession.find_book_inst(@athlete.id)
        if @booking != [] 
            puts "Please select the booking you would like to cancel"
            puts "Original booking:"
            tp @booking, "day", "time", "duration"
            puts "Which booking would you like to cancel?"
            booking = @booking.pluck(:day)
            booking_input = @prompt.select("Day:", booking)
            booking = PTSession.find_booking(booking_input, @athlete.id)
            #booking returns the array of the booking 
            booking_to_cancel = PTSession.find_book_inst(booking_input, @athlete.id)
            #booking_to_cancel returns the instance outside the array
            booking_to_cancel.update athlete_id: 1
            puts "Your booking has been cancelled. Sorry you couldn't make it"
            main_menu

        else
            
            puts "Sorry, there are no bookings to cancel"
            main_menu
        end
    end 


    def main_menu 
        menu_selection = @prompt.select("Menu:") do |menu|
            menu.choice "Book a session"
            menu.choice "View scheduled for this week"
            menu.choice "Logout"
           
        end

        if menu_selection == "Book a session"
            #binding.pry
            pt_book
        elsif menu_selection == "Logout"
            logout?
        else 
            show_sessions
        end

        #binding.pry
    end

end
