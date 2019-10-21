class PTSession < ActiveRecord::Base
    belongs_to :coach
    belongs_to :athlete
end 