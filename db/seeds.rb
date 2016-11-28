# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

config_optimal = TeamConfig.create({
  :description => '2 support, 2 tank, 2 DPS',
  :num_support => 2,
  :num_tank    => 2,
  :num_DPS     => 2
})

config_all_support = TeamConfig.create({
  :description => 'Screwed I guess',
  :num_support => 6,
  :num_tank    => 0,
  :num_DPS     => 0
})


User.create!(email: "example@railstutorial.org",
             password:              "foobar")

99.times do |n|
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(email: email,
               password: password)
end


users = User.order(:created_at)
for i in users
<<<<<<< HEAD
  if  i.id < 2
    UserLookingForTeam.create!(role: "tank", time_queue_started: Time.zone.now, user_id: i.id)
  elsif  i.id < 4 
    UserLookingForTeam.create!(role: "dps", time_queue_started: Time.zone.now, user_id: i.id)
  elsif  i.id < 6
=======
  if  i.id < 20
    UserLookingForTeam.create!(role: "tank", time_queue_started: Time.zone.now, user_id: i.id)
  elsif  i.id < 40 
    UserLookingForTeam.create!(role: "dps", time_queue_started: Time.zone.now, user_id: i.id)
  else
>>>>>>> origin/modeling-teams
    UserLookingForTeam.create!(role: "support", time_queue_started: Time.zone.now, user_id: i.id)
  end
end