class CreateProfessions < ActiveRecord::Migration[5.0]
  def change
    create_table :professions do |t|
    t.string :name
    t.integer :base_dmg
    end
  end
end
