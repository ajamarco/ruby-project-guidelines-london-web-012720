module Fight

    @prompt = TTY::Prompt.new

    def self.fight_intro(mon)
        puts "======================================"
        puts "You have encountered a #{mon.name}!!!"
        puts "======================================"
    end

    def self.battle_options(hero, mon)
        ans = @prompt.select("what will you do?", ["Attack!", "Retreat", "inventory"])
        if ans == "Attack!"
            moves = hero.moves.map{|m| m.name}
            moves << "Jab"
            move = @prompt.select("what will you do?", moves)
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
            puts "Don't be a pussy."
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
         puts "#{hero.name} used #{move}"
         dmg = hero.profession.base_dmg
        else
         puts "#{hero.name} used #{move.name}"
         phys_dmg = (hero.profession.base_dmg * move.hp_damage)
         magic_dmg = (hero.profession.base_dmg * move.mp_damage)
         dmg = phys_dmg + magic_dmg
        end
        puts "#{mon.name} took #{dmg} damage!"
        self.apply_dmg(mon, dmg)
    end

    def self.apply_dmg(char, dmg)
        char.hp -= dmg
        char.save
        if char.hp <= 0
            puts "#{char.name} - 0/100"
            return
        end
        puts "#{char.name} - #{char.hp}/100"
    end

    def self.enemy_attack(mon, hero, move)
        puts "#{mon.name} used #{move.name}"
        puts "#{hero.name} took #{move.hp_damage} damage!"
    end

end