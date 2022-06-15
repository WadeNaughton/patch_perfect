class AddUserGearIdToCompleteGears < ActiveRecord::Migration[5.2]
  def change
    add_reference :complete_gears, :user_gears, foreign_key: true
  end
end
