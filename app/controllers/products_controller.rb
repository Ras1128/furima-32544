class ProductsController < ApplicationController


  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def products_params
    params.require(:product).permit(:content, :image).merge(user_id: current_user.id)
  end
end
