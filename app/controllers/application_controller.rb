class ApplicationController < ActionController::Base

before_filter :authenticate_user!
  
  private
  def after_sign_in_path_for(resource_or_scope)
    dashboard_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  
end