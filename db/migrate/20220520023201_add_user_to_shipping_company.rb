class AddUserToShippingCompany < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :shipping_company, null: true, foreign_key: true
  end
end
