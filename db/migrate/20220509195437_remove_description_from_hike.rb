class RemoveDescriptionFromHike < ActiveRecord::Migration[5.2]
  def change
    remove_column :hikes, :description, :string
  end
end
