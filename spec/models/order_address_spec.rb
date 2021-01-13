require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it '郵便番号が空だと購入できないこと' do
      @order_address.post_code = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code can't be blank")
    end

    it '都道府県が空だと購入できないこと' do
      @order_address.shipping_area_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Shipping area can't be blank")
    end

    it '市区町村が空だと購入できないこと' do
      @order_address.city = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空だと購入できないこと' do
      @order_address.address = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が空だと購入できないこと' do
      @order_address.phone_number = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '郵便番号にハイフンがないと購入できないこと' do
      @order_address.post_code = "12345"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end

    it '電話番号にハイフンがあると購入できないこと' do
      @order_address.phone_number = "1234-56-2435"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid. Don't include hyphen(-)")
    end



  end
end
