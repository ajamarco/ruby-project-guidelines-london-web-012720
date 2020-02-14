module Fight

    @prompt = TTY::Prompt.new
    
    def self.fight_intro(mon)
        sleep 1.5
        puts "======================================"
        GameSound.start_fight
        puts "You have encountered a #{mon.name}!!!"
        puts "======================================"
        sleep 1
    end

    def self.battle_options(hero, mon)
        ans = @prompt.select("what will you do?", ["Attack!", "Retreat", "inventory"])
        if ans == "Attack!"
            moves = hero.moves.map{|m| m.name}
            moves << "Jab"
            move = @prompt.select("Pick a move:", moves)
            if move == "Jab"
            self.attack_calc(hero, mon, move)
            else
            move = Move.find_by(name: move)
            self.attack_calc(hero, mon, move)
            end
            if GameOver.check_game_over(hero, mon)
                return
            end
            move = mon.moves.sample
            self.enemy_attack(mon, hero, move)
            self.apply_dmg(hero, move.hp_damage)
            if GameOver.check_game_over(hero, mon)
                return
            end
            self.battle_options(hero, mon)
        elsif ans == "Retreat"
            puts "================="
            puts "Don't be a pussy.".yellow
            puts "=================="
            self.battle_options(hero, mon)
        else
            Inventory.open_inventory
            item = Inventory.select_item
            item = Inventory.use_item?(item)
            self.battle_options(hero, mon)
        end
    end

    def self.attack_calc(hero, mon, move)
       
        if move == "Jab"
         puts "========================="
         puts "#{hero.name} used #{move}".green
         dmg = hero.profession.base_dmg
        else
         puts "==============================" 
         puts "#{hero.name} used #{move.name}".green
         phys_dmg = (hero.profession.base_dmg * move.hp_damage)
         magic_dmg = (hero.profession.base_dmg * move.mp_damage)
         dmg = phys_dmg + magic_dmg
        end
        puts "#{mon.name} took #{dmg} damage!".green
        self.apply_dmg(mon, dmg)
    end

    def self.apply_dmg(char, dmg)
        char.hp -= dmg
        char.save
        if char.hp <= 0
            
            puts "#{char.name} - 0".red
            puts "===================="
            return
        end
        if char.class == Hero
        puts "#{char.name} - #{char.hp} hp remaining".red
        puts "============================="
        else
        puts "#{char.name} - #{char.hp} hp remaining".green
        puts "============================="
        end
        sleep 0.5
    end

    def self.enemy_attack(mon, hero, move)
        puts "============================="
        puts "#{mon.name} used #{move.name}".red
        puts "#{hero.name} took #{move.hp_damage} damage!".red
    end

end