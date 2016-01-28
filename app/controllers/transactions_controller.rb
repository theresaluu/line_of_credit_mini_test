class TransactionsController < ApplicationController
  def new
    @transaction = Transaction.new()
  end
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.save

    redirect_to credit_path()
  end

  private
  def transaction_params
    params.permit(:amount, :day, :withdrawal)
  end
end
