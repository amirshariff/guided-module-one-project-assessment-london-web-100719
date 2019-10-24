class PTSession < ActiveRecord::Base
    belongs_to :coach
    belongs_to :athlete


    def self.find_availabilites_day(day, athlete_id)
        PTSession.where(day: day, athlete_id: athlete_id)
    end

    def self.find_availabilites_time(day, time)
        PTSession.where(day: day, time: time)
    end

    def self.find_booking(booking, athlete)
        PTSession.where(day: booking, athlete_id: athlete)
    end

    def self.find_session(athlete)
        PTSession.where(athlete_id: athlete)
    end 

    def self.find_book_inst(input, athlete)
        PTSession.find_by(day: input, athlete_id: athlete)
    end



end 

