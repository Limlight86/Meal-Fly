class RecipesController < ApplicationController
  def index
    if @profile.persisted?
      @featured_recipe    = Recipe.joins(recipe_categories: :category)
                              .where(categories: { id: @profile.categories })
                              .sample
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
