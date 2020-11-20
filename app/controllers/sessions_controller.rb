class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: params[:name])
    if user
      log_in user
      flash[:success] = 'Successful Login'
      redirect_to user
    else
      flash[:danger] = 'Invalid Name'
      redirect_back(fallback_location: root_url)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
