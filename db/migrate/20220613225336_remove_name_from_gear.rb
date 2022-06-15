class RemoveNameFromGear < ActiveRecord::Migration[5.2]
  def change
    remove_column :gears, :name, :string
  end
end
