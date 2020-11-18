class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:user][:name])
    if @user.save
      flash[:notice] = 'Successful Sign Up'
      log_in @user
      redirect_to @user
    else
      flash[:alert] = 'Please use a different name'
      redirect_back(fallback_location: signup_path)
    end
  end

  def show
    @user = User.find(params[:id])
    return if logged_in? && current_user == @user

    flash[:alert] = 'Access not allowed. Please login as this user first'
    redirect_to root_url
  end
end
