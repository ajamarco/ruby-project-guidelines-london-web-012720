class CharMove < ActiveRecord::Base
    belongs_to :moveable, polymorphic: true
    belongs_to :move
end