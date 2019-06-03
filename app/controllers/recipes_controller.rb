class RecipesController < ApplicationController
  def index
  end

  def show
    @recipe   = Recipe.find(params[:id])
    @comment  = Comment.new
    @rating   = @recipe.ratings.find_by(user_id: current_user.id) || Rating.new
  end
end
