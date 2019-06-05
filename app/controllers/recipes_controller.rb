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
    @rating       = @recipe.ratings.find_by(user_id: current_user.id) || Rating.new
    @user_recipe  = current_user.user_recipes.find_by(recipe_id: @recipe.id)
    @in_cookbook  = UserRecipe.where(user: current_user, recipe: @recipe).exists?
  end
end
