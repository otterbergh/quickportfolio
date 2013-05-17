require 'time'

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
    @stockdata = Stock.stock_data(@stock.ticker)
    #@stockdata = @stockdata
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @stock }
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
  
  def progress
    @stock = Stock.find(params[:id])
    progress = Hash.new
    progress_response = Hash.new
    
    progress_result = Stock.stock_progress(@stock.ticker, 30)
    
    skip = true
    progress_result.each do |line|
      unless skip
        progress.store (Time.parse(line.split(',')[0]).to_i*1000, line.split(',')[4])
      end
      skip = false
    end
    
    progress = progress.sort_by { |date, close| date }
    
    count = 0;
    progress.each do |key, value|
      progress_response.store (count, value)
      count = count+1
    end
    render :json => progress.to_json
    #render :json => [[0, 31], [0.5, 28.6], [1, 30.0], [1.3, 26.4], [6.2, 37]].to_json
  end
  
end
