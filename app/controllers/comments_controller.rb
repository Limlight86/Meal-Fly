class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def index
    @recipe = current_user.recipe.find(params[:recipe_id])
  end

  def show
  end

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.recipe_id = params[:recipe_id]
    if @comment.save
      redirect_back fallback_location: root_path, notice: 'Comment was successfuly posted.'
    else
      redirect_back fallback_location: root_path, alert: @comment.errors.full_messages.to_sentence
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.find(params[:id])
    @comment.destroy
    redirect_back fallback_location: root_path,
    notice: 'Comment has been removed.'
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user, :email, :id)
  end
end