# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

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