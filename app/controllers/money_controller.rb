class MoneyController < ApplicationController
  before_action :set_money, only: %i[ show destroy ]

  def index
  end

  def create
    @money = Money.new(money_params)
    @wallet = Wallet.find_by(user_id: current_user.id)
    @money_histries = current_user.wallet.money
    total_money_elements = @money_histries.where(wallet_id: @wallet.id).pluck(:yen)
    @total_money = total_money_elements.inject(:+)
    @total_money = 0 if @money_histries[0] == nil
    respond_to do |format|
      if @money.save
        format.html { redirect_to wallet_path(current_user.wallet.id), notice: "Money was successfully created." }
        format.json { render :show, status: :created, location: @money }
      else
        format.html { render 'wallets/show', status: :unprocessable_entity }
        format.json { render json: @money.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @money.destroy
    respond_to do |format|
      format.html { redirect_to money_index_url, notice: "Money was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_money
      @money = Money.find(params[:id])
    end

    def money_params
      params.require(:money).permit(:yen, :wallet_id)
    end
end
