module GameOver

    @prompt = TTY::Prompt.new

    def self.check_char_status(char)
        char.hp <= 0
    end

    def self.battle_won(mon)
        puts "                                                                       ================================================"
        puts "                                                                       #{mon.name} is dead, you live to see another day".green
        puts "                                                                       ================================================"
    end

    def self.check_game_over(hero, mon)
        if GameOver.check_char_status(hero) || GameOver.check_char_status(mon)
            GameOver.check_char_status(hero) ? GameOver.game_finished : GameOver.battle_won(mon)
            true
        end
    end

    def self.game_finished
        puts "                                                                       ==========================================="
        puts "                                                                       #{char.name} is dead, you suck at this game".red
        puts "                                                                       ==========================================="
        @prompt.select('Game Over.', ['Start Again'])
        Game.game
    end
end