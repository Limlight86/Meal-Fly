class ApplicationController < ActionController::Base
  before_action :set_profile
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_profile
    @profile = current_user&.profile || Profile.find_by(id: session[:profile_id]) || Profile.new
  end

  protected

  def configure_permitted_parameters
  # Permit the `username` parameter along with the other
  # sign up parameters.
  devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
