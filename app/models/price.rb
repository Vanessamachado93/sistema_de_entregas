class Price < ApplicationRecord
  belongs_to :shipping_company

  validates :minimum_weight, :maximum_weight, :maximum_cubic_meter, :minimum_cubic_meter, :price_km, presence: true
end
