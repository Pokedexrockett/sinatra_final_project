class CreateStrains < ActiveRecord::Migration[5.2]
    def change
        create_table :strains do |t|
            t.string :name
            t.string :form
            t.decimal :thc
            t.decimal :cbd
            t.string :review
            t.belongs_to :patient
            t.datetime :created_at
            t.datetime :updated_at
        end
    end
end
