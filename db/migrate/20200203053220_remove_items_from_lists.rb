class RemoveItemsFromLists < ActiveRecord::Migration[5.2]
  def change
    remove_column :lists, :items
  end
end
