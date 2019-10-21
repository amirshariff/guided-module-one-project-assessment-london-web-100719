class Athlete < ActiveRecord::Base
    has_many :pt_sessions
    has_many :coaches, through: :pt_session
end 