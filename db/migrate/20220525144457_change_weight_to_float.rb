class ChangeWeightToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :gears, :weight, :float
  end
end
