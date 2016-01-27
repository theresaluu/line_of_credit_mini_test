class TransactionsController < ApplicationController
  def show
    @transaction = Credit.find(params[:id])
  end

  def create
    @task = Credit.find(params[:credit_id).transactions.create()
  end

  def destroy
    @transaction = Credit.find(params[:id])
    @transaction.destroy
  end
end
