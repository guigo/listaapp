class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.integer :amount
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
