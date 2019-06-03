class RecipesController < ApplicationController
  def index
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comment = @recipe.comments.build
    @rating = @recipe.ratings.build
  end
end
