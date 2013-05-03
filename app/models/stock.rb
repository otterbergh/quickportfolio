class Stock < ActiveRecord::Base
  has_many :portfolio_contents, :dependent => :destroy
  has_many :portfolios, :through => :portfolio_contents  
  attr_accessible :name, :ticker
  
  def self.search(query)
    search_condition = "%" + query + "%"
    find(:all, :conditions => ['name LIKE ? OR ticker LIKE ?', search_condition, search_condition])
  end
  
end
