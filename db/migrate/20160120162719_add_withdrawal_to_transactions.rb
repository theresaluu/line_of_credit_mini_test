class AddWithdrawalToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :withdrawal, :boolean
  end
end
