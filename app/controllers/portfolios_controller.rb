class PortfoliosController < ApplicationController
  # GET /portfolios
  # GET /portfolios.json
  def index
    @portfolio = current_user.portfolios.first
    redirect_to @portfolio
  end

  # GET /portfolios/1
  # GET /portfolios/1.json
  def show
    @portfolios = current_user.portfolios.all 
    @portfolio = current_user.portfolios.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @portfolio }
    end
  end
  
  def details
    @portfolio = current_user.portfolios.find(params[:id])
    
    respond_to do |format|
      format.html { render :layout => false}
      format.json { render :layout => false, :json => @portfolio }
    end
  end

  # GET /portfolios/new
  # GET /portfolios/new.json
  def new
    @portfolio = current_user.portfolios.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @portfolio }
    end
  end

  # GET /portfolios/1/edit
  def edit
    @portfolio = current_user.portfolios.find(params[:id])
  end

  # POST /portfolios
  # POST /portfolios.json
  def create
  
    @portfolio =  current_user.portfolios.new(params[:portfolio])

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to @portfolio, :notice => 'Portfolio was successfully created.' }
        format.json { render :json => @portfolio, :status => :created, :location => @portfolio }
      else
        format.html { render :action => "new" }
        format.json { render :json => @portfolio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /portfolios/1
  # PUT /portfolios/1.json
  def update
    @portfolio = current_user.portfolios.find(params[:id])

    respond_to do |format|
      if @portfolio.update_attributes(params[:portfolio])
        format.html { redirect_to @portfolio, :notice => 'Portfolio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @portfolio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolios/1
  # DELETE /portfolios/1.json
  def destroy
    @portfolio = current_user.portfolios.find(params[:id])
    @portfolio.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
