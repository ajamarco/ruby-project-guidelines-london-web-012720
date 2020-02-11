class CreateItemsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :attr_to_change
      t.integer :amount
    end
  end
end