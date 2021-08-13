class CreateResidences < ActiveRecord::Migration[6.0]
  def change
    create_table :residences do |t|
      t.string :postal_code, null: false
      t.string :municipality, null: false
      t.string :address, null: false
      t.string :building_name
      t.string :phone_number, null: false
      t.integer :Shipping_area_id, null: false
      t.integer :purchase_id, null: false
      t.timestamps
    end
  end
end
