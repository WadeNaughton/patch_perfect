class AddTitleToComplete < ActiveRecord::Migration[5.2]
  def change
    add_column :completes, :title, :string
  end
end
