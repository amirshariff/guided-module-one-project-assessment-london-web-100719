#10.times do
 #   Athlete.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: Faker::Number.number(digits: 2), email: Faker::Internet.email)
#end

#10.times do
#    Coach.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, years_experience: Faker::Number.number(digits: 1), email: Faker::Internet.email)
#end

#10.times do
 #  PTSession.create(day: ,time:, duration: Faker::Number.number(digits: 2), athlete_id: Athlete.all.sample.id, coaches_id: Coach.all.sample.id)
#end

20.times do
    Coach.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, years_experience: Faker::Number.number(digits: 1), email: Faker::Internet.email)
    end

    Athlete.create(first_name: "test", last_name: nil , age: nil, email: "test")

    PTSession.create(day: "Monday" ,time: "06:30", duration: 50, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Monday" ,time: "08:30", duration: 45, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Monday" ,time: "12:15", duration: 60, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Monday" ,time: "17:30", duration: 50, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Monday" ,time: "18:30", duration: 45, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Monday" ,time: "12:15", duration: 60, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Tuesday" ,time: "06:30", duration: 50, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Tuesday" ,time: "08:30", duration: 45, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Tuesday" ,time: "12:15", duration: 60, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Tuesday" ,time: "17:30", duration: 50, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Tuesday" ,time: "18:30", duration: 45, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Tuesday" ,time: "12:15", duration: 60, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Wednesday" ,time: "06:30", duration: 50, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Wednesday" ,time: "08:30", duration: 45, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Wednesday" ,time: "12:15", duration: 60, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Wednesday" ,time: "17:30", duration: 50, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Wednesday" ,time: "18:30", duration: 45, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Wednesday" ,time: "12:15", duration: 60, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Thursday" ,time: "06:30", duration: 50, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Thursday" ,time: "08:30", duration: 45, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Thursday" ,time: "12:15", duration: 60, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Thursday" ,time: "17:30", duration: 50, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Thursday" ,time: "18:30", duration: 45, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Thursday" ,time: "12:15", duration: 60, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Friday" ,time: "06:30", duration: 50, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Friday" ,time: "08:30", duration: 45, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Friday" ,time: "12:15", duration: 60, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Friday" ,time: "17:30", duration: 50, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Friday" ,time: "18:30", duration: 45, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Friday" ,time: "12:15", duration: 60, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Saturday" ,time: "06:30", duration: 50, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Saturday" ,time: "08:30", duration: 45, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Saturday" ,time: "12:15", duration: 60, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Saturday" ,time: "17:30", duration: 50, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Saturday" ,time: "18:30", duration: 45, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Saturday" ,time: "12:15", duration: 60, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Sunday" ,time: "06:30", duration: 50, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Sunday" ,time: "08:30", duration: 45, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Sunday" ,time: "12:15", duration: 60, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Sunday" ,time: "17:30", duration: 45, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    PTSession.create(day: "Sunday" ,time: "18:30", duration: 60, athlete_id: Athlete.all.sample.id, coach_id: Coach.all.sample.id)
    

p 'seeds done'  