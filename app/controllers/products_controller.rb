class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :unless, only: [:edit, :update, :destroy]
  
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
  end

  def edit
    if @product.purchase != nil
      redirect_to root_path
    end
  end

  def update
    if @product.update(products_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end


  private

  def set_product
    @product = Product.find(params[:id])
   end

  def unless
    unless current_user.id == @product.user_id
      redirect_to action: :index
    end
  end

  def products_params
    params.require(:product).permit(:name, :description, :price, :category_id, :item_condition_id, :postage_id, :shipping_area_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end

end
