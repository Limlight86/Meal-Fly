class ResultsController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json do
        term = params[:term]
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
  end
  
end