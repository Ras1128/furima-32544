class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :destination
end
