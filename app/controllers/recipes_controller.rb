class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
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
      render 'new'
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
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def assign_categories
    @recipe.recipe_categories.destroy_all
    params[:recipe][:categories].each do |category_id, checked|
      if checked == "1"
        RecipeCategory.create(recipe: @recipe, category_id: category_id)
      end
    end
  end

  def recipe_params
    params.require(:recipe).permit(:name, :servings, :difficulty, :calories, :carbs, :protein, :fat, :sugar, :fiber, :vegan, :gluten_free, :image_url, :recipe_details, :recipe, :video_url, :cooktime)
  end
end
