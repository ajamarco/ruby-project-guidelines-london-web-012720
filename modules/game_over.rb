module GameOver
    def self.check_game_over(char)
        char.hp <= 0
    end

    def self.game_over_msg(char)
        if char.class == Monster
            puts "#{char.name} is dead, you live to see another day"
        else
            puts "#{char.name} is dead, you suck at this game"
        end
    end
end