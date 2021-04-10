Patient.create!(email: 'test@test.com', username: "test")
Strain.create!(name: 'first strain', review:"This is my review", subject: "a new strain", patient_id: 1)
Strain.create!(name: 'second strain', review:"This is my review even more now!", subject: "another strain", patient_id: 1)