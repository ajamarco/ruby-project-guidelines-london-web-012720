class RemoveAmountFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :amount
  end
end
