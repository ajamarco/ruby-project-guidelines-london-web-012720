module Story
    def self.scene01(name)
        door = Sound.new("./sounds/door.wav")
        door.play
        Printing.printing("You enter a house on Road 7. You don't know what is waiting for you, but there's nothing you can do right now, since your car is broken and your partner broke up with you...")
        
        Printing.printing("As you walk in, there's whisper on the corner...")
        
        Printing.printing_dialog("Hey, #{name}... It's you, right? I wouldn't forget about your face so easily",0.04)

        arr_to_selection = ["Yes...", "This is none of your business", "Hey! Long time no see!"]
        option = Selection.selection(arr_to_selection)
        case option
        when arr_to_selection[0]
            puts "\n"
            Printing.printing_dialog("I knew you'd come! Come on! Let's explore this freaking house number 8... Or is it 7? I can't remember mate... Let's go!")
            Printing.printing("The Strange man joined your party...")
        when arr_to_selection[1]
            puts "\n"
            Printing.printing_dialog("I don't know why you are so rude. Have you broke up with your partner? Come on, let's go explore this place!")
            Printing.printing("The Strange man joined your party...")
        when arr_to_selection[2]
            puts "\n"
            Printing.printing_dialog("Hey mate, how's the kids anyway? Let's talk about this later. We need to explore this place.")
            Printing.printing("The Strange man joined your party...")
        end
        scene02(name)
    end 

    def self.scene02(name)
        puts "\n\n"
        Printing.printing("You and your friend are in the living room. \nThere are some things you can do in there...")
        control = 0
        sitted_on_couch = false
        while control == 0 do
            has_key = Item.find_by(name: "key")
            arr_to_selection = ["Sit on the couch", "Open the door to the kitchen", "Check the drawer by the corner", "Open inventory"]
            option = Selection.selection(arr_to_selection)

            case option
            when "Sit on the couch"
                if !sitted_on_couch
                    Printing.printing("You sit on the couch and feel something weird...")
                    Printing.printing_dialog("A spider just bit your ass. You've lost 3 health points.")
                    hero = Hero.find_by(name: name)
                    hero.hp -= 3
                    hero.save
                    GameOver.check_game_over(hero, Monster.find_by(name: 'Bat'))
                    sitted_on_couch = true
                else
                    Printing.printing("You sit in the couch briefly, because you are afraid of getting Coronavirus from a spider...")
                end
            when "Open the door to the kitchen"
                if has_key
                    Printing.printing("You could open the door and storm into the kitchen")
                    control = 1
                    scene03
                else
                    Printing.printing("The door is locked ")
                end
            when "Check the drawer by the corner"
                if !has_key
                    Printing.printing("You found a key to the kitchen!")
                    key = Item.create(name: "key", attr_to_change: "", description: "")
                    HeroItem.create(hero_id: Hero.find_by(name: name).id, item_id: key.id)
                else
                    Printing.printing("There's nothing more for you here!")
                end
                
            when "Open inventory"
                Inventory.open_inventory
                item = Inventory.select_item
                item = Inventory.use_item?(item)
            end

        end
        
    end

    def self.scene03
        control = 0
        has_eated = false
        has_flashlight = false 
        has_fighted = false


        Printing.printing("\n\n\nYou are in the kitchen. It's dirty and cold. You have to decide what to do...")

        
        while control == 0 do
            arr_to_selection = ["Check inside the oven", "Go upstairs", "Talk to the stranger", "Open cabinet", "Open inventory"]
            option = Selection.selection(arr_to_selection)

            case option
            when "Check inside the oven"
                if !has_eated
                    Printing.printing("There's just more dust... And a meat that has been cooked for a couple of days now...")
                    eat = Selection.yer_or_no('Do you want to eat that?')
                    if eat
                        Printing.printing("You feel stronger than before!")
                        has_eated = true
                    end
                else
                    Printing.printing("You already ate an old piece of meat. What else do you want?")
                end
            when "Go upstairs"
                if !has_flashlight
                    Printing.printing("It seems to dark to go upstairs...")
                else
                    Printing.printing("With your flashlight you're not afraid anymore and you go to the upper level...")
                    scene04
                end
            when "Talk to the stranger"
                Printing.printing("bla bla bla")
            when "Open cabinet" 
                if !has_fighted
                    Fight.fight_intro(Monster.first)
                    Fight.battle_options(Hero.first, Monster.first)
                    #TODO remove add flashlight. just add it after battle
                    Item.create(name: "Flashlight", attr_to_change: "", description: "Well, it's a flashlight... So, it flashes a light...")
                    HeroItem.create(hero_id: Hero.first.id, item_id: Item.last.id)
                    Printing.printing("The dead monster drop a flashlight!")
                    has_flashlight = true
                    has_fighted = true
                    return
                else
                    Printing.printing("There's nothing more here but the carcass of the bat you just killed. No, you can't eat that...")
                end                
            when "Open inventory"
                Inventory.open_inventory
                item = Inventory.select_item
                Inventory.use_item?(item)
                #TODO check the inventory with empty database and from beginning of game
            end
        end
    end

    def self.scene04
        Printing.printing("\n\n\n Scene 04")
    end
end