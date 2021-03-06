class UsersController < ApplicationController
  def show
    find_user

    if @user
      render 'users/show'
    else
      redirect_to '/404'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @errors = @user.errors.full_messages

      render 'users/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
