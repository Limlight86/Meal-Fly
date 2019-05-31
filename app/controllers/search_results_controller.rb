class SearchResultsController < ApplicationController

  def index
    term        = params[:term]
    recipies    = Recipe.search(term)
    categories  = Category.search(term)
    if term.present?
      results = recipies + categories
    else
      results = []
    end
    render json: results
  end

end
