class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def logged_in_or_back
    return if logged_in?

    flash[:danger] = 'Please login to continue'
    redirect_to root_url
  end
end
