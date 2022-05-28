class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :sku
      t.integer :distance
      t.decimal :weight
      t.decimal :height
      t.decimal :width
      t.decimal :depth
      t.string :customer_name
      t.string :customer_address

      t.timestamps
    end
  end
end
