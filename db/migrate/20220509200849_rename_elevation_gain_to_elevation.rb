class RenameElevationGainToElevation < ActiveRecord::Migration[5.2]
  def change
    rename_column :hikes, :elevation_gain, :elevation
  end
end
