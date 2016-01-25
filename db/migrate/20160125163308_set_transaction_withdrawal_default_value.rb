class SetTransactionWithdrawalDefaultValue < ActiveRecord::Migration
  def up
    change_column :transactions, :withdrawal, :boolean, null: false, :default => true
  end

  def down
    change_column :transactions, :withdrawal, :boolean, :default => nil
  end
end
