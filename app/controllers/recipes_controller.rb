class RecipesController < ApplicationController
  def index
  end

  def show
<<<<<<< HEAD
=======
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @categories = Category.all
    
  end

  def create
    @recipe = Recipe.new(recipe_params)
    assign_categories
    if @recipe.save
      redirect_to @recipe, notice: "Recipe was successfully created"
    else
      redirect_to new_recipe_url, alert: @recipe.errors.full_messages.to_sentence
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    assign_categories
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Recipe was successfully updated"
    else
      redirect_to edit_recipe_url(@recipe), alert: @recipe.errors.full_messages.to_sentence
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  private

  def set_recipe
>>>>>>> bundle react on rails
    @recipe = Recipe.find(params[:id])
  end
end
