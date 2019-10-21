class CreateCoaches < ActiveRecord::Migration[5.0]
    def change
        create_table :coaches do |t|
          t.string :first_name
          t.string :last_name
          t.integer :years_experience
          t.string :email
        end
      end
  end