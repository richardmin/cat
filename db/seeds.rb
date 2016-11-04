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

config_all_support_hehe = TeamConfig.create({
  :description => 'Screwed I guess',
  :num_support => 6,
  :num_tank    => 0,
  :num_DPS     => 0
})

