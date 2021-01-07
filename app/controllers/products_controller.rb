class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.includes(:user).order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def products_params
    params.require(:product).permit(:name, :description, :price, :category_id, :item_condition_id, :postage_id, :shipping_area_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end
end
