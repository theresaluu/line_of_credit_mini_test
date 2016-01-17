class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.float :apr, null: false
      t.float :line_max, null: false

      t.timestamps null: false
    end
  end
end
