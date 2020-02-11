module Story
    def self.scene01
        door = Sound.new("./sounds/door.wav")
        door.play
        Printing.printing("You enter a house on Road 7. You don't know what is waiting for you, but there's nothing you can do right now, since your car is broken and your partner broke up with you...")
        
        Printing.printing("As you walk in, there's whisper on the corner...")
        
        Printing.printing_dialog("Hey, #{Hero.find(1).name}... It's you, right? I wouldn't forget about your face so easily",0.04)

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
        scene02
    end 

    def self.scene02
        Printing.printing("going to scene 2")
    end
end