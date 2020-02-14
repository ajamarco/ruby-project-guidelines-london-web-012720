module GameSound
    @background = Music.new("./sounds/background.wav")
    @fight = Music.new("./sounds/fight.wav")
    @door = Sound.new("./sounds/door.wav")
    @intro = Sound.new("./sounds/intro.wav")
    @victory = Sound.new("./sounds/victory.wav")
    @game_over = Music.new("./sounds/game_over.wav")
    @background.loop = true
    @fight.loop = true
    @game_over.loop = true


    def self.start_game_over
        @game_over.play
    end

    def self.stop_game_over
        @game_over.stop
    end

    def self.start_background
        @background.play
    end

    def self.stop_background
        @background.stop
    end

    def self.start_fight
        @fight.play
    end

    def self.stop_fight
        @fight.stop
    end

    def self.play_door
        @door.play
    end

    def self.play_intro
        @intro.play
    end

    def self.play_victory
        @victory.play
    end

    def self.fade_background(ms)
        @background.fadeout(ms)
    end

    def self.fade_fight(ms)
        @fight.fadeout(ms)
    end
end