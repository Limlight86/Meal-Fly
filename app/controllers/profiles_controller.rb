class ProfilesController < ApplicationController

  def edit
    @categories = Category.all
  end

  def update
    @profile.assign_attributes(profile_params)
    if @profile.save
      assign_categories
      session[:profile_id] = @profile.id
      if @profile.user && current_user == @profile.user
        redirect_to root_url, notice: "Profile successfully updated"
      elsif current_user
        @profile.update(user: current_user)
        redirect_to root_url, notice: "Profile successfully updated"
      elsif @profile.user
        redirect_to new_user_session_path, notice: "Profile successfully updated, Sign into your account"
      else
        redirect_to new_user_registration_url, notice: "Create an account to be able to rate recipes and add comments"
      end
    else
      redirect_to new_profile_path, alert: @profile.errors.full_messages.to_sentence
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:skill_level)
  end

  def assign_categories
    @profile.profile_categories.destroy_all
    params[:profile][:categories].each do |category_id, checked|
      if checked == "1"
        ProfileCategory.create(profile: @profile, category_id: category_id)
      end
    end
  end

end
