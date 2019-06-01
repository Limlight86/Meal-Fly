class RecipesController < ApplicationController
  def index
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user_recipe = current_user.user_recipes.where(recipe_id: @recipe.id).first
  end
end
