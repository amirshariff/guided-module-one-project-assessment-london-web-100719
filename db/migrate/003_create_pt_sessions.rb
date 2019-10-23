class CreatePtSessions < ActiveRecord::Migration[5.0]
    def change
        create_table :pt_sessions do |t|
          t.string :day
          t.string :time
          t.integer :duration
          t.integer :athlete_id
          t.integer :coach_id
        end
      end
  end