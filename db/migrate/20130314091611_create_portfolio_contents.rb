class CreatePortfolioContents < ActiveRecord::Migration
  def change
    create_table :portfolio_contents do |t|
      t.integer :portfolio_id, :null => false
      t.integer :stock_id, :null => false
      t.decimal :purchase_price
      t.datetime :purchase_at
      t.integer :quantity

      t.timestamps
    end
  end
end
