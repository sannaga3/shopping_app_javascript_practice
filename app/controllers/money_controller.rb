class MoneyController < ApplicationController
  before_action :set_money, only: %i[ show destroy ]

  def index
    @money = Money.all
  end

  def create
    @money = Money.new(money_params)

    respond_to do |format|
      if @money.save
        format.html { redirect_to wallet_path(current_user.wallet.id), notice: "Money was successfully created." }
        format.json { render :show, status: :created, location: @money }
      else
        format.html { render :new, status: :unprocessable_entity }
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
