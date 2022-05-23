class Price < ApplicationRecord
  validates :minimum_weight, :maximum_weight, :maximum_cubic_meter, :minimum_cubic_meter, :price_km, presence: true
  belongs_to :shipping_company
end
