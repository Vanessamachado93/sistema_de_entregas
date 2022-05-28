class Order < ApplicationRecord
  belongs_to :shipping_company
  belongs_to :product
end
