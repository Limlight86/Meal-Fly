class RecipesController < ApplicationController
  def index
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
