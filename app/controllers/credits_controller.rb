class CreditsController < ApplicationController
  def index
    @credits = Credit.all
  end

  def new
    @credit = Credit.new()
  end

  def create
    @credit = Credit.new(credit_params)
    if @credit.save
      redirect_to @credit
    end
  end

  def show
    @credit = Credit.find(params[:id])
    @transactions = @credit.transactions
  end

  private
  def credit_params
    params.require(:credit).permit(:name, :apr, :line_max)
  end
end
