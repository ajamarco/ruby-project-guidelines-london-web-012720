class CreateCharMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :char_moves do |t|
      t.integer :move_id
      t.references :imageable, polymorphic: true
    end
  end
end


# create_table :heros do |t|
#   t.string :name
#   t.integer :hp
#   t.integer :mp
#   t.integer :profession_id