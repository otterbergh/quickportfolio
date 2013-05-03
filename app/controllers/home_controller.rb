class HomeController < ApplicationController
skip_before_filter :authenticate_user!  
  def index
    unless current_user.nil?
      redirect_to dashboard_path
    end
  end
end
