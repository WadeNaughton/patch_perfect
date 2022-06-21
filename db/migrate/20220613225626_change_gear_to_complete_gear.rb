class ChangeGearToCompleteGear < ActiveRecord::Migration[5.2]
  def change
    rename_table :gears, :complete_gears
  end
end
