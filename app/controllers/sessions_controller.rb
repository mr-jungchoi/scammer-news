class SessionsController < ApplicationController
  def new
  end

  def create
   @user = User.find_by_username(params[:username]).try(:authenticate, params[:password])
   if @user
     session[:user_id] = @user.id
     redirect_to root_path
   else
     @errors = ["This username/password combination does not match."]
     render 'sessions/new'
   end
  end

  def destroy
   session.clear
   redirect_to root_path
  end
end
