class CreditLineMaxChangeNull < ActiveRecord::Migration
  def change
    change_column_null :credits, :line_max, true
    change_column_null :transactions, :amount, true
    change_column_null :transactions, :day, true
  end
end
