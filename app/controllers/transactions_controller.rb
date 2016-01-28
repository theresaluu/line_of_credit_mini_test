class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new()
  end
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.save
    redirect_to credit_path(@transaction.id)
  end

  private
  def transaction_params
    params.require(:transaction).permit(:amount, :day, :withdrawal)
  end
end
