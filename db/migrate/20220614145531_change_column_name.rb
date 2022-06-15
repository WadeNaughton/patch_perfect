class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :complete_gears, :user_gears_id, :user_gear_id
  end
end
