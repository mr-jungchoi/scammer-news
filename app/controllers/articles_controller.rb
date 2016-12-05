class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = find_article
  end

  def new

  end

  def create

  end

  def destroy

  end

  private

  def find_article
    Article.find_by_id(params[:id])
  end

end
