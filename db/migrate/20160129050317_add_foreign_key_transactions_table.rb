class AddForeignKeyTransactionsTable < ActiveRecord::Migration
  def change
    remove_column :transactions, :credit_id, :integer
    add_reference :transactions, :credit, index: true
    add_foreign_key :transactions, :credits
  end
end
