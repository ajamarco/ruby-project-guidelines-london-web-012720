class Monster < ActiveRecord::Base
    has_many :char_moves, as: :imageable
end