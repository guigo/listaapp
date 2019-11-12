class RemoveAmountToProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :product, :amount
  end
end
