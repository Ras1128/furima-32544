class OrdersController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @order_address = OrderAddress.new
  end

  def create
    @product = Product.find(params[:product_id])
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
       @order_address.save
       redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:post_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :transaction_id).merge(user_id: current_user.id, product_id: @product.id)
  end

  
end
