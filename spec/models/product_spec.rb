require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#create' do
    before do
      @product = FactoryBot.build(:product)
    end

      it '商品画像が空だと出品できないこと' do
        @product.name = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空だと出品できないこと' do
        @product.name = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明が空だと出品できないこと' do
        @product.description = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーが空だと出品できないこと' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品状態が空だと出品できないこと' do
        @product.item_condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Item condition must be other than 1")
      end

      it '配送料の負担についてが空だと出品できないこと' do
        @product.postage_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Postage must be other than 1")
      end

      it '発送元の地域についてが空だと出品できないこと' do
        @product.shipping_area_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping area must be other than 1")
      end

      it '発送までの日数についてが空だと出品できないこと' do
        @product.shipping_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping day must be other than 1")
      end

      it '価格についてが空だと出品できないこと' do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it '価格の範囲が、¥300~¥9,999,999の間以外では出品できないこと' do
        @product.price = "200"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '販売価格は半角数字以外では保存できないこと' do
        @product.price = "３００"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
  end
end