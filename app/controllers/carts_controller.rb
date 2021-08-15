class CartsController < ApplicationController
  before_action :set_cart, only: %i[ destroy ]

  def add_item
    @cart = Cart.find_or_create_by(user_id: current_user.id)
    @cart_items = @cart.cart_items.where(bought: false)
    @shops = Shop.all
    @items = Item.all
  end

  def buy_item
    @cart = Cart.find(params[:id])
    @cart_items = @cart.cart_items.where(bought: false)
    @cart_items.map do |cart_item|
      cart_item[:bought] = true
      cart_item.save
    end
    redirect_to add_item_cart_path(@cart.id)
  end

  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: "Cart was successfully created." }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_cart
      @cart = Cart.find(params[:id])
    end

    def cart_params
      params.require(:cart).permit(:user_id)
    end
end
