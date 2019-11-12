class CreateReservedStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :reserved_stocks do |t|
      t.integer :amount
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
