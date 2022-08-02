class AddLatitudeToHikes < ActiveRecord::Migration[5.2]
  def change
    add_column :hikes, :latitude, :float
  end
end
