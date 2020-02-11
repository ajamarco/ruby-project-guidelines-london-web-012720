class Hero < ActiveRecord::Base
    belongs_to :profession
    has_many :char_moves, as: :moveable
    has_many :moves, through: :char_moves
end

