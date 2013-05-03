require 'net/http'

class StocksController < ApplicationController
  # GET /stocks
  # GET /stocks.json
  def index
    @stocks = Stock.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @stocks }
    end
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
    @stock = Stock.find(params[:id])
    @stockdata = stock_data(@stock.ticker)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @stock, :json => @stockdata }
    end
  end
  
  def search
    unless params[:query_stock].nil?
      @stocks = Stock.search(params[:query_stock])
      if @stocks.length == 1
        redirect_to :action => "show", :id => @stocks.first.id
      end
    end
  end

  def stock_data(symbol)
    url = URI::parse "http://download.finance.yahoo.com/d/quotes.csv?s=#{symbol}&f=c1l1t1ohgv"
    req = Net::HTTP::get(url).gsub /"/, ''

    #
    # do stuff, e.g. save data to database, etc.
    #
    @stockdata = req.split(",");
    #respond_to do |format|
    #  format.json { render :json => @stockdata}
    #end
    return @stockdata
  end  
  
end
