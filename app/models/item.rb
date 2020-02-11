class Item < ActiveRecord::Base
    has_many :hero_items
    has_many :heros, through: :hero_items
end
