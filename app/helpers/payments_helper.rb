module PaymentsHelper
  def total_payments(payments)
    payments.inject(0) { |accum, payment| accum + payment.amount }
  end
end
