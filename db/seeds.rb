puts '🌱 Seeding..... 🌱'

15.times do |i|
  alien =
    Alien.create(
      name: "Alien #{i}",
      earth_disguise_name: "Totally Normal Human #{i}",
      home_planet: (0...8).map { (65 + rand(26)).chr }.join,
      light_years_to_home_planet: rand(1..30_000)
    )
  puts alien
end

30.times do |i|
  earthling =
    Earthling.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      job: Faker::Job.title
    )

  puts earthling
end

100.times do
  visit =
    Visitation.create(
      date: rand(10.years.ago..Time.now),
      alien: Alien.all.sample,
      earthling: Earthling.all.sample
    )
end

puts '🌱 ..... All Done Seeding! 🌱'
