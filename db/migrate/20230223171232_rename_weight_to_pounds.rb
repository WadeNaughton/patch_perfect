class RenameWeightToPounds < ActiveRecord::Migration[5.2]
  def change
    rename_column :user_gears, :weight, :pounds
  end
end
