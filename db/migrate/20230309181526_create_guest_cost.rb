class CreateGuestCost < ActiveRecord::Migration[5.2]
  def change
    create_table :guest_costs do |t|
      t.references :participant, foreign_key: true
      t.float :price
      t.string :item
    end
  end
end
