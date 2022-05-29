class Order < ApplicationRecord
  belongs_to :shipping_company
  belongs_to :product
  before_create :generate_code

  enum status: { pending: 1, accepted: 2, rejected: 3 }, _default: :pending

  private

  def generate_code
    self.code = SecureRandom.alphanumeric(15).upcase
  end
end
