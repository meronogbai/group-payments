class PaymentsController < ApplicationController
  before_action :logged_in_or_back
  def index
    @payments = Payment.where('author_id=?', current_user.id)
  end

  def new
    @payment = Payment.new
  end

  def create
    payment = Payment.new(payment_params)
    payment.author_id = current_user.id
    if payment.save
      group_id = params[:payment][:group_id]
      PaymentsGroup.create(group_id: group_id, payment_id: payment.id) if group_id
      flash[:success] = 'Payment added'
      redirect_to payments_path
    else
      flash[:danger] = 'Invalid payment'
      redirect_back(fallback_location: new_payment_path)
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount)
  end
end
