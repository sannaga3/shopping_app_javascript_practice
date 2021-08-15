class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[ show  destroy ]

  # GET /cart_items or /cart_items.json
  def index
    @cart_items = CartItem.all
  end

  # GET /cart_items/1 or /cart_items/1.json
  def show
  end

  # GET /cart_items/new
  def new
    @cart_item = current_user.cartItems.build(cart_item_params)
  end

  # POST /cart_items or /cart_items.json
  def create
    @cart_item = CartItem.new(cart_item_params)

    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to add_item_cart_path(current_user.id), notice: "Cart item was successfully created." }
        format.json { render :show, status: :created, location: @cart_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cart_items/1 or /cart_items/1.json
  def update
    @cart = Cart.find_or_create_by(user_id: current_user.id)
    @cart_items = @cart.cart_items.where(bought: false)
    @cart_item = CartItem.find(params[:cart_item][:id])
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.html { redirect_to add_item_cart_path(current_user.id), notice: "Cart item was successfully updated." }
        format.json { render :show, status: :ok, location: @cart_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_items/1 or /cart_items/1.json
  def destroy
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to add_item_cart_path(current_user.id), notice: "Cart item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_item_params
      params.require(:cart_item).permit(:quantity, :cart_id, :item_id)
    end
end
