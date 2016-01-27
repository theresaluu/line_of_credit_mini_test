class ChangeAprLineMaxNull < ActiveRecord::Migration
  def change
    change_column_null :credits, :apr, false
    change_column_null :credits, :line_max, false
  end
end
