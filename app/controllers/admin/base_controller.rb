class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_user_is_admin

  private

  def validate_user_is_admin
    unless current_user.admin?
      redirect_to new_user_session_path, alert: "You must be an admin."
    end
  end
end
