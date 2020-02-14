module GameOver

    @prompt = TTY::Prompt.new

    def self.check_char_status(char)
        char.hp <= 0
    end

    def self.battle_won(mon)
        # door = Sound.new("./sounds/door.wav")
        # door.play
        victory = Sound.new("./sounds/victory.wav")
        sleep 1
        puts "================================================"
        victory.play
        puts "#{mon.name} is dead, you live to see another day".green
        puts "================================================"
    end

    def self.check_game_over(hero, mon)
        if GameOver.check_char_status(hero) || GameOver.check_char_status(mon)
            GameOver.check_char_status(hero) ? GameOver.game_finished(hero) : GameOver.battle_won(mon)
            true
        end
    end

    def self.game_finished(char)
        sleep 1
        puts "==========================================="
        puts "#{char.name} is dead, you suck at this game".red
        puts "==========================================="
        option = @prompt.select('Game Over.', ['Start Again', 'Exit Game'])
        case option
        when 'Start Again'
            Game.game
        when 'Exit Game'
            Printing.printing("\n\n\n\nHAHAHHAHAHAAHAHAHA")
            Story.change_control
        end
    end
        

end