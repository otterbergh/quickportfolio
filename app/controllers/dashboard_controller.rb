class DashboardController < ApplicationController
  
  def index
    @user = User.find(current_user)
    @portfolios = @user.portfolios
  end

end
