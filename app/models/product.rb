class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :shipping_area
  belongs_to :item_condition
  belongs_to :postage
  belongs_to :shipping_day

  with_options presence: true do
    validates :name
    validates :description
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :shipping_area_id
    validates :item_condition_id
    validates :postage_id
    validates :shipping_day_id
  end

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/ }

end
