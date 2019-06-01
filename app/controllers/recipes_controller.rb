class RecipesController < ApplicationController
  def index
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user_recipe = current_user.user_recipes.find_by(recipe_id: @recipe.id)
  end
end
