# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

# Create Users
5.times do
 user = User.new(
   name:     Faker::Name.name,
   email:    Faker::Internet.email,
   password: Faker::Lorem.characters(10)
 )
 user.save!
end
users = User.all

# Create Lists
150.times do
 List.create!(
   title: Faker::Lorem.sentence,
   user: users.sample,
 )
end
lists = List.all

#Create Items
1000.times do
  Item.create!(
    name: Faker::Lorem.sentence,
    list: lists.sample
  )
end
items = Item.all


# Create an admin user
admin = User.new(
   name:     'Admin User',
   email:    'admin@bloccitoff.com',
   password: 'helloworld',
)
admin.skip_confirmation!
admin.save!
 
puts "Seeds finished."
puts "#{User.count} users created."