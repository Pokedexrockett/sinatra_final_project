Patient.create!(email: 'test@test.com', username: "test")
Strain.create!(name: 'first strain', ish:"Indica", form: "joint", thc: 19.2, cbd: .03, review: "alright", patient_id: 1)
Strain.create!(name: 'second strain', ish:"Sativa", form: "bowl", thc: 17.5, cbd: .02, review: "okay",, patient_id: 1)