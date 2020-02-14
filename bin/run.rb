require_relative '../config/environment'

module Game
    def self.game 
        NewGame.welcome
        name = NewGame.pick_name
        name = NewGame.welcome_user(name) 
        char = NewGame.pick_class(name) 
        Story.scene01(name)
    end

end

Game.game