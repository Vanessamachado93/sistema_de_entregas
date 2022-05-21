class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :license_plate
      t.string :brand
      t.string :code_model
      t.string :manufact_year
      t.integer :capacity
      t.belongs_to :shipping_company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
