class Monster < ActiveRecord::Base
    has_many :char_moves, as: :moveable
    has_many :moves, through: :char_moves
end

