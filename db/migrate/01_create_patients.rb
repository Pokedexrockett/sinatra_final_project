class CreatePatients < ActiveRecord::Migration[4.2]
    def change
        create_table :patients do |t|
            t.string :email
            t.string :username
            t.datetime :created_at
            t.datetime :updated_at
        end
    end
end