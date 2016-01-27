class CreditAprChangeNull < ActiveRecord::Migration
  def change
    change_column_null :credits, :apr, true
  end
end
