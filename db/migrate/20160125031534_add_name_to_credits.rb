class AddNameToCredits < ActiveRecord::Migration
  def change
    add_column :credits, :name, :string, null: false, index: true
  end
end
