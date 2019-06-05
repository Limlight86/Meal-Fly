class RecipesController < ApplicationController
  def index
    if @profile.persisted?
      skill_levels = Profile.skill_levels
      @featured_recipe    = Recipe.for_profile(@profile).sample
      @featured_category  = @profile.categories.sample
    else
      @featured_recipe    = Recipe.all.sample
      @featured_category  = Category.all.sample
    end
  end

  def show
    @recipe       = Recipe.find(params[:id])
    @comments     = @recipe.comments.includes(:user)
    @comment      = Comment.new
    @rating       = @recipe.ratings.find_by(user: current_user) || Rating.new
    @user_recipe  = UserRecipe.find_by(recipe_id: @recipe.id, user: current_user)
    @in_cookbook  = @user_recipe.present?
  end
end
