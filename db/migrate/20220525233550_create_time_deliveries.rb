class CreateTimeDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :time_deliveries do |t|
      t.integer :min_distance
      t.integer :max_distance
      t.integer :time
      t.belongs_to :shipping_company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
