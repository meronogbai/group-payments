class StaticPagesController < ApplicationController
  def home
    return unless logged_in?

    redirect_to current_user
  end
end
