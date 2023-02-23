class AddOuncesToUserGears < ActiveRecord::Migration[5.2]
  def change
    add_column :user_gears, :ounces, :integer
  end
end
