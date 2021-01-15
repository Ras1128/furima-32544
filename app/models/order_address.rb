class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :product_id, :user_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "is invalid. Don't include hyphen(-)" }
    validates :token
    validates :user_id
    validates :product_id
  end

  validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }


    def save
      purchase = Purchase.create(user_id: user_id, product_id: product_id)
      Destination.create(post_code: post_code,  shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
    end
end
