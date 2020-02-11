class Hero < ActiveRecord::Base
    belongs_to :profession
    has_many :char_moves, as: :moveable
    has_many :moves, through: :char_moves
    has_many :hero_items
    has_many :items, through: :hero_items
end

