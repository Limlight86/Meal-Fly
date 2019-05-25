class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :servings, :difficulty, :calories, :carbs, :protein, :fat, :sugar, :fiber, :vegeterian, :gluten_free, :image_url)
  end

end
