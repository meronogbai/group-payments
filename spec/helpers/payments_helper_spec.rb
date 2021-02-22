require 'rails_helper'

RSpec.describe PaymentsHelper, type: :helper do
  describe 'total payments' do
    before(:example) do
      user = User.create(name: 'test_user', password: '123456')
      5.times do |i|
        Payment.create(name: "test_payment_#{i}", amount: i, author_id: user.id)
      end
      @payments = Payment.all
    end
    it 'gives sum of all payments' do
      expect(total_payments(@payments)).to eq 10
    end
  end
end
