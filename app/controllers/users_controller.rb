class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:user][:name])
    if @user.save
      flash[:success] = 'Successful Sign Up'
      log_in @user
      redirect_to @user
    else
      flash[:danger] = 'Please use a different name'
      redirect_back(fallback_location: signup_path)
    end
  end

  def show
    @user = User.find(params[:id])
    return if logged_in? && current_user == @user

    flash[:danger] = 'Access not allowed. Please login as this user first'
    redirect_to root_url
  end
end
