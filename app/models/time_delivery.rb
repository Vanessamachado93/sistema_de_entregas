class TimeDelivery < ApplicationRecord
  validates :min_distance, :max_distance, :time, presence: true
  belongs_to :shipping_company
end
