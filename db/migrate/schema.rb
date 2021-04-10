ActiveRecord::Schema.define(version: 2021_03_16_222716) do
    create_table "strains", force: :cascade do |t|
        t.string "name"
        t.string "ish"
        t.string "form"
        t.numeric "thc"
        t.numeric "cbd"
        t.string "review"
        t.belongs_to "patient"
        t.datetime "created_at"
        t.datetime "updated_at"
        t.index ["patient_id"], name: "index_strains_on_patient_id"
    end

    create_table "patients", force: :cascade do |t|
        t.string "email"
        t.string "username"
        t.datetime "created_at"
        t.datetime "updated_at"
        t.string "password_digest"
    end
  end