class CommentsController < ApplicationController
  before_action :find_article_for_comment, only: [:create, :edit, :update, :destroy]
  before_action :find_comment, only: [:edit, :update, :destroy]

  def create
    @comment = @article.comments.new(comment_params)
    @comment.commenter = current_user

    if @comment.save
      redirect_to @article
    else
      @errors = @comment.errors.full_messages

      render 'articles/show'
    end
  end

  def edit
  end

  def update
    @comment.update_attributes(comment_params)

    if @comment.save
      redirect_to @article
    else
      @errors = @comment.errors.full_messages

      render 'comments/edit'
    end
  end

  def destroy
    @comment.destroy

    redirect_to @article
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
