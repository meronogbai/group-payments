class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name])
    if @user.save
      flash[:notice] = 'Successful Sign Up'
      redirect_to @user
    else
      flash[:alert] = 'Please use a different name'
      redirect_back(fallback_location: signup_path)
    end
  end
end
