class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :set_cache_headers
  def set_cache_headers
    response.headers['Cache-Control'] = 'no-cache, no-store'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = 'Mon, 01 Jan 1990 00:00:00 GMT'
  end

  private

  def logged_in_or_back
    return if logged_in?

    flash[:danger] = ['Please login to continue']
    redirect_to root_url
  end
end
