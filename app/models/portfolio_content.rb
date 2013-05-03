class PortfolioContent < ActiveRecord::Base
  belongs_to :portfolio
  belongs_to :stock
  attr_accessible :portfolio_id, :purchase_at, :purchase_price, :quantity, :stock_id
end
