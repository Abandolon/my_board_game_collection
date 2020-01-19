# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require_relative 'mechanics_master.rb'
require_relative 'categories_master.rb'

puts "Resetting all Boardgame Mechanics"
Boardgamesmechanic.destroy_all
puts "Successfully reset Boardgame Mechanic references"

puts "Resetting all Boardgame Categories"
Boardgamescategory.destroy_all
puts "Successfully reset Boardgame Categories references"


puts "Resetting All Mechanics"

Mechanic.destroy_all

puts "Resetting All Categories"

Category.destroy_all

# Create Mechanics
puts "Creating Mechanics"

@mechanics_master["mechanics"].each do |mechanic|
  Mechanic.create(name: mechanic["name"], bga_id: mechanic["id"])
  puts "#{mechanic["name"]} has been created"
end

puts "Completed. Successfully created #{Mechanic.count} mechanics"

# Create Categories

puts "Creating Categories"

@categories_master["categories"].each do |category|
  Category.create(name: category["name"], bga_id: category["id"])
  puts "#{category["name"]} has been created"

end

puts "Completed. Successfully created #{Category.count} categories"

puts "Creating Avatars"

CSV.foreach("mob_filenames.csv") do |row|
  Avatar.create(image: row)
end
