class PaymentsController < ApplicationController
  before_action :logged_in_or_back
  def index
    @payments = Payment.where('author_id=?', current_user.id)
  end

  private

  def logged_in_or_back
    return if logged_in?

    flash[:danger] = 'Please login to view your transactions'
    redirect_to root_url
  end
end
