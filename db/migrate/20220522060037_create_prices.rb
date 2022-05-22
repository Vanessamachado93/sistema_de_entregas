class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.decimal :minimum_weight
      t.decimal :maximum_weight
      t.integer :maximum_cubic_meter
      t.integer :minimum_cubic_meter
      t.integer :price_km
      t.belongs_to :shipping_company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
