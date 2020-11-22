require 'rails_helper'

RSpec.describe PaymentsGroup, type: :model do
  before(:example) do
    @user = User.create(name: 'test_user')
    @group = Group.create(name: 'haha', user_id: @user.id)
    @payment = Payment.create(name: 'haha', amount: 500, author_id: @user.id)
  end

  it "doesn't validate if group doesn't exist" do
    pgroup = PaymentsGroup.new(group_id: 1000, payment_id: @payment.id)
    expect(pgroup.valid?).to be false
  end

  it "doesn't validate if payment doesn't exist" do
    pgroup = PaymentsGroup.new(payment_id: 1000, group_id: @group.id)
    expect(pgroup.valid?).to be false
  end

  it 'validates with valid info' do
    pgroup = PaymentsGroup.new(payment_id: @payment.id, group_id: @group.id)
    expect(pgroup.valid?).to be true
  end
end
