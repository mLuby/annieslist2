class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #redirect after login
  def after_sign_in_path_for(resource)
    locations_path
  end
end
