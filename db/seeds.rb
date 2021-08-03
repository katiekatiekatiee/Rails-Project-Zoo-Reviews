# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# data = RestClient.get 'https://public.opendatasoft.com/api/records/1.0/search/?dataset=us-cities-demographics&q=&facet=city&facet=state&facet=race'
# # byebug
# location_data_array = JSON.parse(data)["records"]["fields"]
# location_data_array.each do |location|
#     Location.create(state: location["state"])
# end   THIS DOESNT WORK

# states = CS.states(:us)
# states.each do |key, value|
#     Location.find_or_create_by(state: value)
# end     https://github.com/loureirorg/city-state

#User.create(username: "Captain Squiggles", email: "ahoymate22@aol.com", password: "captainsquiggs22" )
# User.create(username: "Ellie", email: "catsruledogsdrool@gmail.com", password: "snacks247" )
# User.create(username: "Happy the Clown", email: "clownshoes@yahoo.com", password: "popcorn1911" )
# User.create(username: "Scott", email: "lettucehead45@outlook.com", password: "ilovelettuce24" )

