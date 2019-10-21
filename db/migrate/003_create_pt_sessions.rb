class CreatePtSessions < ActiveRecord::Migration[5.0]
    def change
        create_table :pt_sessions do |t|
          t.integer :duration
          t.integer :athletes_id
          t.integer :coaches_id
        end
      end
  end