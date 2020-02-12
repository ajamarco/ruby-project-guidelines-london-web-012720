module GameOver
    def self.check_game_over(hero)
        if hero.hp <= 0
            puts "\n\n\n goto game over page"
        else
            Printing.printing_dialog("Your HP is now #{hero.hp}\n\n")
        end
    end
end