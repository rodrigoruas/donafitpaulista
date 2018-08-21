class Order < ApplicationRecord
  belongs_to :meal
  belongs_to :user
  # belongs_to :cart
  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
