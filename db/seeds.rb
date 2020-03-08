# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  patient = Patient.create(
    first_name: Faker::TvShows::ParksAndRec.character, 
    last_name: Faker::Movies::HarryPotter.spell,
    age: Faker::Number.number(digits: 2),
    phone: Faker::PhoneNumber.phone_number
  )
  3.times do
    doctor = Doctor.create(
      last_name: Faker::FunnyName.three_word_name,
      specialty: Faker::Cannabis.strain
    )

    Appointment.create(
      date_time: Faker::Date.in_date_period(year: 2020, month: 3),
    )
  end
end

puts "data has been seeded"
