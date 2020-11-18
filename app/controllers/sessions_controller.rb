class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: params[:name])
    if user
      log_in user
      flash[:notice] = 'Successful Login'
      redirect_to root_url
    else
      flash[:alert] = 'Invalid Name'
      redirect_back(fallback_location: root_url)
    end
  end

  def delete; end
end
