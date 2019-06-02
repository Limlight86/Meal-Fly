class CommentsController < ApplicationController

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
    if current_user.id == @comment.user.id or current_user.admin?
      @comment.destroy
    else
      redirect_back fallback_location: root_path, alert: @comment.errors.full_messages.to_sentence
    end
    redirect_back fallback_location: root_path,
    notice: 'Comment has been removed.'
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user)
  end
end