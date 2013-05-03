class AutocompleteController < ApplicationController

respond_to :json

  def stock
    like = '%' + params[:term] + '%';
    stocks = Stock.where("name like ? or ticker like ?", like, like).limit(5)
    
    result = Array.new
    stocks.each do |s|
        result << { :label => s.name }
    end
    
    unless stocks.first.nil?
      respond_with(result.to_json)  
    end
  end

end