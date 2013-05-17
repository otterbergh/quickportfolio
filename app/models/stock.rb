require 'net/http'
require 'time'

class Stock < ActiveRecord::Base
  has_many :portfolio_contents, :dependent => :destroy
  has_many :portfolios, :through => :portfolio_contents  
  attr_accessible :name, :ticker
  
  def self.search(query)
    search_condition = "%" + query + "%"
    find(:all, :conditions => ['name LIKE ? OR ticker LIKE ?', search_condition, search_condition])
  end
  
  def self.stock_data(symbol)
  #"http://download.finance.yahoo.com/d/quotes.csv?s=#{symbol}&f=c1l1t1ohgv"
    url = URI::parse "http://query.yahooapis.com/v1/public/yql?q=select%20Change%2C%20PercentChange%2C%20LastTradePriceOnly%2C%20LastTradeTime%2C%20Volume%2C%20Open%2C%20DaysHigh%2C%20DaysLow%2C%20YearHigh%2C%20YearLow%20%20from%20yahoo.finance.quotes%20where%20symbol%20in%20(%22#{symbol}%22)&format=json&env=http%3A%2F%2Fdatatables.org%2Falltables.env"
    req = Net::HTTP::get(url).gsub('\"', '"')
    req = JSON.parse(req)
    return req["query"]["results"]["quote"]
  end

  def self.stock_progress(symbol, days_back)
  end_date = Date.today
  end_day = end_date.day
  end_month = end_date.month-1
  end_year = end_date.year
  start_date = (end_date - days_back)
  start_day = start_date.day
  start_month = start_date.month-1
  start_year = start_date.year
  #"http://download.finance.yahoo.com/d/quotes.csv?s=#{symbol}&f=c1l1t1ohgv"
    url = URI::parse "http://ichart.finance.yahoo.com/table.csv?s=#{symbol}&a=#{start_month}&b=#{start_day}&c=#{start_year}&d=#{end_month}&e=#{end_day}&f=#{end_year}&g=d&ignore=.csv"
    req = Net::HTTP::get(url).gsub('\"', '"')
    return req.lines.to_a
  end
  
end
