class UserRecipesController < ApplicationController
  before_action :set_recipe, only: [:create, :destroy]
  
  def index
    @user_recipes = current_user.user_recipes.includes(:recipe)
  end

  def create
    current_user.user_recipes.find_or_create_by(recipe: @recipe)
    render json: { success: true }
  end

  def destroy
    current_user.user_recipes.where(recipe: @recipe).destroy_all
    render json: { success: true }
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
