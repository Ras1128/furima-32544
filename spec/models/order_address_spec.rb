require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      seller = FactoryBot.create(:user)
      buyer = FactoryBot.create(:user)
      product = FactoryBot.build(:product, user_id: seller.id)
      @order_address = FactoryBot.build(:order_address, user_id: buyer.id, product_id: product.id)
    end

    context '購入者情報登録がうまく行く時' do

      it '全て入力されている場合登録できる' do
        @order_address.valid?
      end

      it '建物名がなくても登録できる' do
        @order_address.building_name = ""
        @order_address.valid?
      end
    end


    context '購入者情報登録がうまく行かない時' do
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
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

      it '電話番号が12桁あると購入できないこと' do
        @order_address.phone_number = "123456243512"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Don't include hyphen(-)")
      end

      it 'user_idが無いと購入できないこと' do
        @order_address.user_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'product_idが無いと購入できないこと' do
        @order_address.product_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
