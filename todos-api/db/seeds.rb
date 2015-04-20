# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

User.delete_all
user = User.create!(email: "truongnguyen@gmail.com", password:"test@123")
10.times do
	completed = rand(2) == 1 ? true : false
	user.items << Item.create!(name: Faker::Commerce.product_name, description: Faker::Lorem.sentence, completed: completed)
end
