class ProductsController < ApplicationController
  before_action :find_product, only: %i[edit update show destroy]

  def index
    @products = Product.all
  end

  def show
    @cart_item = CartItem.new(quantity: 1)
    @cart_item.product = @product
  end

  def new
    @product = Product.new
  end

  def create
    product = current_user.products.create(product_params)

    if product
      flash[:notice] = "#{product.name} is added in products."
    else
      flash[:alert] = product.errors.full_messages
    end
    redirect_to products_path
  end

  def update    
    @product.images.purge unless product_params[:images].nil?
    redirect_to @product.update(product_params) ? product_path : :edit
    flash[:notice] = "#{@product.name} is updated."
  end

  def destroy
    @product.images.purge
    flash[:notice] = if @product.destroy
      "#{@product.name} is deleted from products."
    else
      @product.errors.full_messages
    end
    redirect_to(mine_products_path)
  end

  def mine
    @products = current_user.products
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity, images: [])
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
