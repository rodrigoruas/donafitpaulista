class Order < ApplicationRecord
  belongs_to :meal
  belongs_to :user
  validates :user, presence: false
end
