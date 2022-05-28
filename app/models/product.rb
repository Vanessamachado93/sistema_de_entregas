class Product < ApplicationRecord
  validates :customer_name, :customer_address, :distance, :height, :width, :depth, :weight, presence: true
end
