# Add seed data here. Seed your database with `rake db:seed`

Move.create(name: "Fire", mp_damage:0, hp_damage:6, cost:4)
Move.create(name: "Blizzard", mp_damage:0, hp_damage:4, cost:5)
Move.create(name: "Smit of Justice", mp_damage:4, hp_damage:6, cost:7)

Profession.create(name: "Warrior", base_dmg: 5)
Profession.create(name: "Mage", base_dmg: 4)

# Movie.create(title: "Wargames", release_date: 1983, director: "John Badham", lead: "Matthew Broderick", in_theaters: false)
# t.string  "name"
# t.integer "base_dmg"