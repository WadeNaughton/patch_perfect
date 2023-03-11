class CreateCost < ActiveRecord::Migration[5.2]
  def change
    create_table :costs do |t|
      t.references :complete, foreign_key: true
      t.float :price
    end
  end
end
