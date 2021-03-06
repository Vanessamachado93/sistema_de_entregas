class ShippingCompany < ApplicationRecord
  validates :brand_name, :corporate_name, :registration_number, :address, :city, :state, :email_domain, presence: true
  validates :registration_number, uniqueness: true
  validates :registration_number, format: { with: /\A\d{14}\z/ }

  enum status: { active: 1, inactive: 2 }, _default: :inactive

  has_many :users
  has_many :vehicles
  has_many :prices
  has_many :time_deliveries
end
