class CartItemsController < ApplicationController
  include CartItemsHelper

  def index
    if current_user.present?
      @cart_items = current_user.cart_items
    else
      session[:cart] ||= {}
      @cart_items = []
      session[:cart].each do |key, value|
        @cart_items.push << CartItem.new(product_id: key.to_i, quantity: value) unless Product.find_by(id: key.to_i).nil?
        session[:cart].delete(key) if Product.find_by(id: key.to_i).nil?
      end
    end
  end

  def create    
    cart_item = CartItem.new(cart_item_params)
    current_user.present? ? create_cart(cart_item) : add_to_session(cart_item.quantity)
    redirect_to :cart_items
  end

  def update; end

  def destroy
    begin
      if current_user.present?
        @cart_item = current_user.cart_items.find_by(product_id: params[:id])
        @cart_item.destroy
      else
        @cart_item = CartItem.new(product_id: params[:id], quantity: session[:cart][params[:id]])
        session[:cart].delete(params[:id])
      end
      flash[:notice] = 'Product has been removed from cart.'
    rescue StandardError
      flash[:alert] = 'Product not found.'
    end
    
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end

end
