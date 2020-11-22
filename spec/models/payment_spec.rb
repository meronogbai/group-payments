require 'rails_helper'

RSpec.describe Payment, type: :model do
  before(:example) do
    @user = User.create(name: 'test_user')
    @amount = 50
  end

  it "doesn't validate payment with short name" do
    payment = Payment.new(name: 'ha', amount: @amount, author_id: @user.id)
    expect(payment.valid?).to be false
  end

  it "doesn't validate payment if user doesn't exist" do
    payment = Payment.new(name: 'ha', amount: @amount, author_id: 9)
    expect(payment.valid?).to be false
  end

  it "doesn't validate payment if amount is not a number" do
    payment = Payment.new(name: 'haha', amount: 'ha', author_id: 9)
    expect(payment.valid?).to be false
  end

  it 'validates payment with name with proper attrs' do
    payment = Payment.new(name: 'haha', amount: @amount, author_id: @user.id)
    expect(payment.valid?).to be true
  end
end
