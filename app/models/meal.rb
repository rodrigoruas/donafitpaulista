class Meal < ApplicationRecord
  has_many :orders
  monetize :price_cents
end
