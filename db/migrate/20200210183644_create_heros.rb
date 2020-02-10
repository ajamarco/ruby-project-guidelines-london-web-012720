class CreateHeros < ActiveRecord::Migration[5.0]
  def change
    create_table :heros do |t|
      t.string :name
      t.integer :hp
      t.integer :mp
      t.integer :profession_id
    end
  end
end


