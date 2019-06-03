class CommentsController < ApplicationController

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
    if current_user.admin?
      @comment = @recipe.comments.find(params[:id])
    else
      @comment = @recipe.comments.where(user: current_user).find(params[:id])
    end
    @comment.destroy
    redirect_back fallback_location: root_path,
    notice: 'Comment has been removed.'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
