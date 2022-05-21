class Vehicle < ApplicationRecord
  validates :license_plate, :brand, :code_model, :manufact_year, :capacity, presence: true
  validates :license_plate, uniqueness: true
  validates :license_plate, length: { is: 7 }
  validates :capacity, numericality: { only_integer: true }

  belongs_to :shipping_company
end
