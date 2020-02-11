class Hero < ActiveRecord::Base
    belongs_to :profession
    has_many :char_moves, as: :imageable 
end