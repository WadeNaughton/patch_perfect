class RenamePeakElevationIntegerToProminence < ActiveRecord::Migration[5.2]
  def change
    rename_column :hikes, :peak_elevation_integer, :prominence
  end
end
