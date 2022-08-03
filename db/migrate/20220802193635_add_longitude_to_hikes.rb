class AddLongitudeToHikes < ActiveRecord::Migration[5.2]
  def change
    add_column :hikes, :longitude, :float
  end
end
