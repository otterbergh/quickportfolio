class Portfolio < ActiveRecord::Base
  belongs_to :user
  has_many :portfolio_contents, :dependent => :destroy
  has_many :stocks, :through => :portfolio_contents  
  attr_accessible :name, :user_id
end
