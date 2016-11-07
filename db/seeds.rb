# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_roles
	Role.create([
		{name: 'admin', 			level: 1},
		{name: 'employee', 		level: 2},
		{name: 'wholesaler', 	level: 3},
		{name: 'mobile', 			level: 4},
		{name: 'member', 			level: 5}
	])
	puts 'create roles success!'
end

create_roles()
