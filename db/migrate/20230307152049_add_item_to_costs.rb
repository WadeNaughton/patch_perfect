class AddItemToCosts < ActiveRecord::Migration[5.2]
  def change
    add_column :costs, :item, :string
  end
end
