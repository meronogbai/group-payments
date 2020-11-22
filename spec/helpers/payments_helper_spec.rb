require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PaymentsHelper. For example:
#
# describe PaymentsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PaymentsHelper, type: :helper do
  describe 'total payments' do
    before(:example) do
      user = User.create(name: 'test_user')
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
