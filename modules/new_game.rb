module NewGame

    @prompt = TTY::Prompt.new
    

    def self.welcome()
        Hero.destroy_all
        HeroItem.destroy_all
        Item.destroy_all
        Monster.destroy_all
        self.create_monsters

        system 'clear'
        puts "


                      ███╗   ██╗ ██████╗  ██████╗ ██████╗         ██████╗ ███████╗██╗   ██╗    ██████╗ ██████╗ ███████╗███████╗███████╗███╗   ██╗████████╗███████╗
                      ████╗  ██║██╔═══██╗██╔═══██╗██╔══██╗        ██╔══██╗██╔════╝██║   ██║    ██╔══██╗██╔══██╗██╔════╝██╔════╝██╔════╝████╗  ██║╚══██╔══╝██╔════╝
                      ██╔██╗ ██║██║   ██║██║   ██║██████╔╝        ██║  ██║█████╗  ██║   ██║    ██████╔╝██████╔╝█████╗  ███████╗█████╗  ██╔██╗ ██║   ██║   ███████╗
                      ██║╚██╗██║██║   ██║██║   ██║██╔══██╗        ██║  ██║██╔══╝  ╚██╗ ██╔╝    ██╔═══╝ ██╔══██╗██╔══╝  ╚════██║██╔══╝  ██║╚██╗██║   ██║   ╚════██║
                      ██║ ╚████║╚██████╔╝╚██████╔╝██████╔╝███████╗██████╔╝███████╗ ╚████╔╝     ██║     ██║  ██║███████╗███████║███████╗██║ ╚████║   ██║   ███████║
                      ╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚══════╝╚═════╝ ╚══════╝  ╚═══╝      ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝
                                                                                                                                                    
        "

       
        sleep 1
        
        puts "
        
                      ███████╗ ██████╗██████╗ ███████╗ █████╗ ███╗   ███╗███████╗     ██████╗ ███╗   ██╗    ██████╗  ██████╗  █████╗ ██████╗     ███████╗
                      ██╔════╝██╔════╝██╔══██╗██╔════╝██╔══██╗████╗ ████║██╔════╝    ██╔═══██╗████╗  ██║    ██╔══██╗██╔═══██╗██╔══██╗██╔══██╗    ╚════██║
                      ███████╗██║     ██████╔╝█████╗  ███████║██╔████╔██║███████╗    ██║   ██║██╔██╗ ██║    ██████╔╝██║   ██║███████║██║  ██║        ██╔╝
                      ╚════██║██║     ██╔══██╗██╔══╝  ██╔══██║██║╚██╔╝██║╚════██║    ██║   ██║██║╚██╗██║    ██╔══██╗██║   ██║██╔══██║██║  ██║       ██╔╝ 
                      ███████║╚██████╗██║  ██║███████╗██║  ██║██║ ╚═╝ ██║███████║    ╚██████╔╝██║ ╚████║    ██║  ██║╚██████╔╝██║  ██║██████╔╝       ██║  
                      ╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝     ╚═════╝ ╚═╝  ╚═══╝    ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═════╝        ╚═╝  
                                                                                                                                           
        "
  
    end

    def self.pick_name
      name = @prompt.ask("                                                                                Choose a name:")
      name
    end

    def self.welcome_user(n)
        puts TTY::Box.frame "Welcome #{n}!", padding: 3, width: 100, top: 25, left: 40, align: :center, style: {
            fg: :black,
            bg: :white,
            border: {
              fg: :black,
              bg: :red
            }
          }
        n
    end

    def self.pick_class(n)
        c = Profession.all.map{|p| p.name}
        classification = @prompt.select("                                                                                 
            
                                                                                Choose a class:", c)
        if classification == "Warrior"
            puts "Offensive character with high base health"
            ans = @prompt.select("Choose Warrior?", ["yes", "no"])
            if ans == "yes"
                hero = Hero.create(name: n, hp: 100, mp: 70, profession_id: 1) 
                hero2 = Hero.create(name: "Alex", hp: 70, mp: 100, profession_id: 2) 
                item1 = Item.create(name: "Potion", attr_to_change: "hp", description: "A magical potion that recovers 5hp")
                item2 = Item.create(name: "MP recovery", attr_to_change: "mp", description: "A magical potion that recovers 5mp")
                HeroItem.create(hero_id: hero.id, item_id: item1.id)
                HeroItem.create(hero_id: hero2.id, item_id: item2.id)
                CharMove.create(move_id: 1, moveable_type: "Hero", moveable_id: hero.id)
                CharMove.create(move_id: 2, moveable_type: "Hero", moveable_id: hero.id)
                CharMove.create(move_id: 2, moveable_type: "Hero", moveable_id: hero2.id)
                CharMove.create(move_id: 3, moveable_type: "Hero", moveable_id: hero2.id)
                CharMove.create(move_id: 2, moveable_type: "Monster", moveable_id: 1)
                CharMove.create(move_id: 2, moveable_type: "Monster", moveable_id: 2)
                CharMove.create(move_id: 3, moveable_type: "Monster", moveable_id: 3)
             else
                self.pick_class(n)
             end
        else
            puts "Magical character with high mana levels"
            ans = @prompt.select("Choose Mage?", ["yes", "no"])
            if ans == "yes"
            hero = Hero.create(name: n, hp: 70, mp: 100, profession_id: 2)
            hero2 = Hero.create(name: "Ben", hp: 100, mp: 70, profession_id: 1) 
            item1 = Item.create(name: "Potion", attr_to_change: "hp", description: "A magical potion that recovers 5hp")
            item2 = Item.create(name: "MP recovery", attr_to_change: "mp", description: "A magical potion that recovers 5mp")
            HeroItem.create(hero_id: hero.id, item_id: item1.id)
            HeroItem.create(hero_id: hero2.id, item_id: item2.id)
            CharMove.create(move_id: 2, moveable_type: "Hero", moveable_id: hero.id)
            CharMove.create(move_id: 1, moveable_type: "Hero", moveable_id: hero.id)
            CharMove.create(move_id: 2, moveable_type: "Hero", moveable_id: hero2.id)
            CharMove.create(move_id: 3, moveable_type: "Hero", moveable_id: hero2.id)

            else
            
                self.pick_class(n)
            end
        end
        hero
    end

    def self.create_monsters
        bat = Monster.create(name: "Bat", hp: 100, mp: 0)
        buggyman = Monster.create(name: "Buggyman", hp: 150, mp: 5)
        caveman = Monster.create(name: "Caveman", hp: 200, mp: 0)

        CharMove.create(move_id: 2, moveable_type: "Monster", moveable_id: bat.id)
        CharMove.create(move_id: 2, moveable_type: "Monster", moveable_id: buggyman.id)
        CharMove.create(move_id: 3, moveable_type: "Monster", moveable_id: caveman.id)
    end
end