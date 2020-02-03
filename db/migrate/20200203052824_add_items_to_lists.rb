class AddItemsToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :items, :string
  end
end
