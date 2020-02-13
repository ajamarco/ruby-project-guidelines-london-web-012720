class CreateMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :moves do |t|
      t.string :name
      t.integer :mp_damage
      t.integer :hp_damage
      t.integer :cost
    end
  end
end
