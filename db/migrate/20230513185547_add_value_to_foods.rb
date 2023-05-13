class AddValueToFoods < ActiveRecord::Migration[7.0]
  def change
    add_column :foods, :value, :decimal
  end
end
