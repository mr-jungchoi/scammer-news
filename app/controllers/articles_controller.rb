class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :find_user, except: [:index]

  def index
    @articles = Article.all
  end

  def show
    if @article
      @comment = Comment.new

      render 'articles/show'
    else
      redirect_to root_path
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to @article
    else
      @errors = @article.errors.full_messages
    end
  end

  def edit
    @article = find_article
  end

  def update
    @article.update_attributes(article_params)

    if @article.save
      redirect_to @article
    else
      @errors = @article.errors.full_messages

      render 'articles/edit'
    end
  end

  def destroy
     @article.destroy

     redirect_to user_articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
