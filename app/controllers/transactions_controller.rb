class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new()
  end

  def create
    @credit = Credit.find(params[:credit_id])
    @transaction = @credit.transactions.create(transaction_params)
    redirect_to credit_path(@credit.id)
  end

  private
  def transaction_params
    params.require(:transaction).permit(:amount, :day, :withdrawal)
  end
end
