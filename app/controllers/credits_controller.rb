class CreditsController < ApplicationController
  def index
    @credits = Credit.all
    @credit ||= Credit.create()
  end

  def show
    @credit = Credit.find(params[:id])
  end

  def new
    @credit = Credit.new()
  end

  def create
    @credit = Credit.new(credit_params)
    @credit.save
    redirect_to @credit
  end

  def destroy
    @deleted = Credit.find(params[:id]).destroy
    @credit = Credit.includes(transactions: :transactions).first
    render :show
  end

  private
  def credit_params
    params.require(:credit).permit(:name, :apr, :line_max)
  end

end
