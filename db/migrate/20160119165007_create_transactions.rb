class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.belongs_to :credit, index: true
      t.float :amount
      t.integer :day
      t.string :type

      t.timestamps null: false
    end
  end
end
