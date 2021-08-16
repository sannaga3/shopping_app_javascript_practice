class WalletsController < ApplicationController
  before_action :set_wallet, only: %i[ show destroy ]

  def show
    @money = Money.new
    @money_history = current_user.wallet.money
    @total_money = 0
    @money_history.each do |money|
      @total_money += money[:yen]
    end
    @total_money = 0 if @money_history[0] == nil
  end

  def destroy
    @wallet.destroy
    respond_to do |format|
      format.html { redirect_to wallets_url, notice: "Wallet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_wallet
      @wallet = Wallet.find(params[:id])
    end

    def wallet_params
      params.require(:wallet).permit(:user_id)
    end
end
