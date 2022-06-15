class RemoveWeightFromGear < ActiveRecord::Migration[5.2]
  def change
    remove_column :gears, :weight, :float
  end
end
