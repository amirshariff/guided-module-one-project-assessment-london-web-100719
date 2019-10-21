10.times do
    Athlete.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: Faker::Number.number(digits: 2), email: Faker::Internet.email)
end

10.times do
    Coach.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, years_experience: Faker::Number.number(digits: 1), email: Faker::Internet.email)
end

10.times do
   PTSession.create(duration: Faker::Number.number(digits: 2), athletes_id: Athlete.all.sample.id, coaches_id: Coach.all.sample.id)
end