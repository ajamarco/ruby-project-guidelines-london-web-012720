module NewGame

    @prompt = TTY::Prompt.new
    

    def self.welcome()
        
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
            hero = Hero.create(name: n, hp: 100, mp: 100, profession_id: 1)
        else
            hero = Hero.create(name: n, hp: 100, mp: 100, profession_id: 2)
        end

        hero
    end
end