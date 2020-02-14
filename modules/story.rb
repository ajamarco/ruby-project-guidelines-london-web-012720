module Story
    @control = 0
    @background = Music.new("./sounds/background.wav")
    @fight = Music.new("./sounds/fight.wav")
    @background.loop = true
    @fight.loop = true

    def self.change_control
        @control = 1
    end

    def self.scene01(name)
        door = Sound.new("./sounds/door.wav")
        door.play
        Printing.printing("You enter a house on Road 7. You don't know what is waiting for you, but there's nothing you can do right now, since your car is broken and your partner broke up with you...")
        sleep 1
        Printing.printing("As you walk in, there's whisper on the corner...")
        sleep 1
        Printing.printing_dialog_g("Hey, #{name}... It's you, right? I wouldn't forget about your face so easily")
        sleep 1
        arr_to_selection = ["Yes...", "This is none of your business", "Hey! Long time no see!"]
        option = Selection.selection(arr_to_selection)
        case option
        when arr_to_selection[0]
            puts "\n"
            Printing.printing_dialog_g("I knew you'd come! Come on! Let's explore this freaking house number 8... Or is it 7? I can't remember mate... Let's go!")
            sleep 1
            Printing.printing("The Strange man joined your party...")
        when arr_to_selection[1]
            puts "\n"
            Printing.printing_dialog_r("I don't know why you are so rude. Have you broke up with your partner? Come on, let's go explore this place!")
            sleep 1
            Printing.printing("The Strange man joined your party...")
            puts "\n"
        when arr_to_selection[2]
            puts "\n"
            Printing.printing_dialog_g("Hey mate, how's the kids anyway? Let's talk about this later. We need to explore this place.")
            sleep 1
            Printing.printing("The Strange man joined your party...")
            puts "\n"
        end
        scene02(name)
    end 

    def self.scene02(name)
        @background.play
        puts "\n\n"
        Printing.printing("You and your friend are in the living room. \nThere are some things you can do in there...")
        puts "\n"
        sleep 1
        sitted_on_couch = false

        while @control == 0 do
            
            has_key = Item.find_by(name: "key")
            arr_to_selection = ["Sit on the couch", "Open the door to the kitchen", "Check the drawer by the corner", "Open inventory"]
            option = Selection.selection(arr_to_selection)

            case option
            when "Sit on the couch"
                if !sitted_on_couch
                    Printing.printing("You sit on the couch and feel something weird...")
                    sleep 0.5
                    puts "\n"
                    Printing.printing_dialog_r("A spider just bit your ass. You've lost 3 health points.")
                    hero = Hero.find_by(name: name)
                    hero.hp -= 3
                    hero.save
                    GameOver.check_game_over(hero, Monster.find_by(name: 'Bat'))
                    sitted_on_couch = true
                else
                    puts "\n"
                    Printing.printing("You sit in the couch briefly, because you are afraid of getting Coronavirus from a spider...")
                    puts "\n"
                end
            when "Open the door to the kitchen"
                if has_key
                    puts "\n"
                    Printing.printing("You could open the door and storm into the kitchen")
                    puts "\n"
                    control = 1
                    scene03
                else
                    puts "\n"
                    Printing.printing("The door is locked ")
                    puts "\n"
                end
            when "Check the drawer by the corner"
                if !has_key
                    puts "\n"
                    Printing.printing("You found a key to the kitchen!")
                    puts "\n"
                    key = Item.create(name: "key", attr_to_change: "", description: "An old rusted key.")
                    HeroItem.create(hero_id: Hero.find_by(name: name).id, item_id: key.id)
                else
                    puts "\n"
                    Printing.printing("There's nothing more for you here!")
                    puts "\n"
                end
                
            when "Open inventory"
                Inventory.open_inventory
                item = Inventory.select_item
                item = Inventory.use_item?(item)
            end

        end
        
    end

    def self.scene03
        has_eated = false
        has_flashlight = false 
        has_fighted = false
        sleep 0.5
        Printing.printing("\n\n\nYou are in the kitchen. It's dirty and cold. You have to decide what to do...")

        while @control == 0 do
            @background.resume
            arr_to_selection = ["Check inside the oven", "Go upstairs", "Talk to the stranger", "Open cabinet", "Open inventory"]
            option = Selection.selection(arr_to_selection)

            case option
            when "Check inside the oven"
                if !has_eated
                    puts "\n"
                    Printing.printing("There's just more dust... And a meat that has been cooked for a couple of days now...")
                    puts "\n"
                    sleep 1
                    eat = Selection.yer_or_no('Do you want to eat that?')
                    if eat
                        puts "\n"
                        Printing.printing("You feel stronger than before!")
                        mp_rec = Item.find_by(name: "MP recovery")
                        new_item = HeroItem.create(hero_id: Hero.first.id, item_id: mp_rec.id)
                        Inventory.check_use_item_response("Yes", new_item)
                        
                        has_eated = true
                        
                    end
                else
                    puts "\n"
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
                Printing.printing_dialog_g("Do you want to ask me anything?")
                arr_to_selection_2 = ["What's your name?", "How did you come to a place like this?", "Do you know any other information?"]
                chat = Selection.selection(arr_to_selection_2)
                case chat
                when arr_to_selection_2[0]
                    Printing.printing_dialog_g("It has been such long years that I have forget my own name. For some reason I remembered yours, but I don't know why...")
                when arr_to_selection_2[1]
                    Printing.printing_dialog_g("I was a software engineer studuent at Flatiron. I went crazy in the middle of a class that I lost my mind and came up to find this place. Can't remember much else...")
                when arr_to_selection_2[2]
                    Printing.printing_dialog_g("I know some tricks, such as your real name:   #{ENV['USER']}")
                end

            when "Open cabinet" 
                if !has_fighted
                    @background.fadeout(1000)
                    sleep 2
                    @fight.play
                    Fight.fight_intro(Monster.first)
                    Fight.battle_options(Hero.first, Monster.first)
                    @fight.fadeout(500)
                    @fight.stop
                    Item.create(name: "Flashlight", attr_to_change: "", description: "Well, it's a flashlight... So, it flashes a light...")
                    HeroItem.create(hero_id: Hero.first.id, item_id: Item.last.id)
                    sleep 1
                    Printing.printing("The dead monster drop a flashlight!") if @control == 0
                    has_flashlight = true
                    has_fighted = true
                    @background.play
                    sleep 1
                else
                    Printing.printing("There's nothing more here but the carcass of the bat you just killed. No, you can't eat that...")
                end                
            when "Open inventory"
                Inventory.open_inventory
                item = Inventory.select_item
                Inventory.use_item?(item)
                
            end
        end
    end

    def self.scene04
        
        sleep 1
        Printing.printing("\n\n\n You've arrived in the toilet. Its smells pretty ok for a place like this...")
        sleep 1
        Printing.printing("As soon as you enter, something jump right in front of you!!")
        @background.fadeout(500)
        Fight.fight_intro(Monster.second)
        @fight.play
        Fight.battle_options(Hero.first, Monster.second)
        @fight.fadeout(100)
        @fight.stop
        sleep 1
        @background.play
        Printing.printing("After the battle you are ready to explore the room")
        while @control == 0 
            @background.resume
            arr_to_selection = ["Check Yourself in the mirror", "Go to the bedroom", "Open inventory"]
            option = Selection.selection(arr_to_selection)

            case option
            when "Check Yourself in the mirror"
                Printing.printing("You look awesome!")

            when "Go to the bedroom"
                scene05    
                
            when "Open inventory"
                Inventory.open_inventory
                item = Inventory.select_item
                Inventory.use_item?(item)
            end
        end
    end

    def self.scene05
        
        Printing.printing("\n\n\n As soon as you enter you decided to check under the bed and you finally find...")
        Fight.fight_intro(Monster.third)
        Fight.battle_options(Hero.first, Monster.third)

        
        while @control == 0
            @background.resume 
            Printing.printing("\n\n\n The stranger says to you:")
            Printing.printing_dialog_g("You killed that monster! I guess I own you this.")
            Printing.printing_dialog_r("But if you think this is the end, well, you gotta another thing coming... ")
            Printing.printing("\n\n\n TO BE CONTINUED...", 0.05)
            sleep 3
            change_control
        end

    end
end