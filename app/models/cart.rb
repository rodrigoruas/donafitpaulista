class Cart < ApplicationRecord
  has_many :orders
  has_many :meals, through: :orders
end
