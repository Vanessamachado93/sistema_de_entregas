class ShippingCompany < ApplicationRecord
  validates :brand_name, :corporate_name, :registration_number, :address, :city, :state, :email_domain, presence: true
  validates :registration_number, uniqueness: true
  validates :registration_number, format: { with: /\A\d{14}\z/ }
  validates :email_domain, format: { with: /\A[a-z0-9]+\.[a-z]+(.[a-z]+)?\z/i }

  has_many :users
  has_many :vehicles
end
