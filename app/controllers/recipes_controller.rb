class RecipesController < ApplicationController
  def index
  end

  def show
    @recipe   = Recipe.find(params[:id])
    @comment  = Comment.new
  end
end
