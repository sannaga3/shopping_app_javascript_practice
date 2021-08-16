class MoneyController < ApplicationController
  before_action :set_money, only: %i[ show edit update destroy ]

  # GET /money or /money.json
  def index
    @money = Money.all
  end

  # GET /money/1 or /money/1.json
  def show
  end

  # GET /money/new
  def new
    @money = Money.new
  end

  # GET /money/1/edit
  def edit
  end

  # POST /money or /money.json
  def create
    @money = Money.new(money_params)

    respond_to do |format|
      if @money.save
        format.html { redirect_to @money, notice: "Money was successfully created." }
        format.json { render :show, status: :created, location: @money }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @money.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /money/1 or /money/1.json
  def update
    respond_to do |format|
      if @money.update(money_params)
        format.html { redirect_to @money, notice: "Money was successfully updated." }
        format.json { render :show, status: :ok, location: @money }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @money.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /money/1 or /money/1.json
  def destroy
    @money.destroy
    respond_to do |format|
      format.html { redirect_to money_index_url, notice: "Money was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_money
      @money = Money.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def money_params
      params.require(:money).permit(:yen, :wallet_id)
    end
end
