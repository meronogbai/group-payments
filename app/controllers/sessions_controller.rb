class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user&.authenticate(params[:session][:password])
      log_in @user
      flash[:success] = ['Successful Login']
      redirect_to @user
    else
      flash.now[:danger] = ["User doesn't exist"]
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
