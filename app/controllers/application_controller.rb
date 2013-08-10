class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || friends_path
  end
end
