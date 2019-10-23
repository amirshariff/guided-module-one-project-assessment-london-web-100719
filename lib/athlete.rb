class Athlete < ActiveRecord::Base
    has_many :pt_sessions
    has_many :coaches, through: :pt_session

    #class method that creates an athlete row in the athlete database. 
    #Is a class method cause it is being called on the on the class(factory) in general as the athlete instace has yet to be created
    def self.create_athlete(first_name, last_name, age, email)
        Athlete.create(first_name: first_name, last_name: last_name, age: age, email: email)
    end 

end 