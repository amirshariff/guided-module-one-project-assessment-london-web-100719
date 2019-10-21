class Coach < ActiveRecord::Base
    has_many :pt_sessions
    has_many :athletes, through: :pt_sessions
end 