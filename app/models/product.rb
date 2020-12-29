class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :area
  belongs_to :condition
  belongs_to :postage
  belongs_to :shipping_day

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :area_id
    validates :condition_id
    validates :postage_id
    validates :shipping_day_id
  end
end
