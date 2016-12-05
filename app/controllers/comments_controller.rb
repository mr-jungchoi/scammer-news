class CommentsController < ApplicationController
  before_action :find_article_for_comment, only: [:show, :create, :destroy]
  before_action :find_comment, only: [:show, :edit, :update, :destroy]

  def create
    @comment = @article.comments.new(comment_params)
    @comment.commenter = current_user

    if @comment.save
      redirect_to 'articles/show'
    else
      @errors = @comment.errors.full_messages

      render 'articles/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
