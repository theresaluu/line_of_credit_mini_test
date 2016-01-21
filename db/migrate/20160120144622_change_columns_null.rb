class ChangeColumnsNull < ActiveRecord::Migration
  def change
    change_column_null :transactions, :day, false
    change_column_null :transactions, :amount, false
    change_column_null :transactions, :type, false
  end
end
