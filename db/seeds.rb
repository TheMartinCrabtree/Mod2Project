# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Monster.write_monster_to_database

dm1 = Dungeonmaster.create(name: "Ross")
dm2 = Dungeonmaster.create(name: "Martin")

player1 = Player.create(name: "Oscar", player_level: 3, player_hp: 43, dungeonmaster:dm1)
player2 = Player.create(name: "Megan", player_level: 1, player_hp: 15, dungeonmaster:dm1)
player3 = Player.create(name: "Janet", player_level: 2, player_hp: 12, dungeonmaster:dm1)
player4 = Player.create(name: "Mackenzie", player_level: 8, player_hp: 20, dungeonmaster:dm2)
player5 = Player.create(name: "Franco", player_level: 10, player_hp: 28, dungeonmaster:dm2)
player6 = Player.create(name: "Ali", player_level: 9, player_hp: 41, dungeonmaster:dm2)


encounter1 = Encounter.create(dungeonmaster_id: dm1.id, name: "Round One Fight!")


