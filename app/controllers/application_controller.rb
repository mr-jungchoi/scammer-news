class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorized?

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def authorized?(owner)
    current_user && current_user == owner
  end

  private

  def find_article
    @article = Article.find_by_id(params[:id])
  end

  def find_user
    @user = User.find_by_id(params[:id])
  end
end
