class CreateHeroItemsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :hero_items do |t|
      t.integer :hero_id
      t.integer :item_id
    end
  end
end
