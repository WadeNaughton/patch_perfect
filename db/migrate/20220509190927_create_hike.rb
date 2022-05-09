class CreateHike < ActiveRecord::Migration[5.2]
  def change
    create_table :hikes do |t|
      t.string :name
      t.integer :elevation_gain
      t.string :peak_elevation_integer
      t.string :state
      t.string :location
      t.string :range
      t.string :features
      t.string :description
    end
  end
end
