class CharMove < ActiveRecord::Base
    belongs_to :imageable, polymorphic: true
    belongs_to :move
end