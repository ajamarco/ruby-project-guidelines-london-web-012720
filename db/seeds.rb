# Add seed data here. Seed your database with `rake db:seed`

Move.create(name: "Fire", mp_damage:0, hp_damage:6, cost:4)
Move.create(name: "Blizzard", mp_damage:0, hp_damage:4, cost:5)
Move.create(name: "Smit of Justice", mp_damage:4, hp_damage:6, cost:7)

Profession.create(name: "Warrior", base_dmg: 5)
Profession.create(name: "Mage", base_dmg: 4)

Monster.create(name: "Bat", hp: 10, mp: 0)
Monster.create(name: "Buggyman", hp: 20, mp: 5)
Monster.create(name: "Caveman", hp: 25, mp: 0)

Hero.create(name: "Alex", hp: 20, mp: 3, profession_id: 2)
Hero.create(name: "Ben", hp: 20, mp: 5, profession_id: 1)

CharMove.create(move_id: 2, moveable_type: "Hero", moveable_id: 1)
CharMove.create(move_id: 2, moveable_type: "Monster", moveable_id: 2)