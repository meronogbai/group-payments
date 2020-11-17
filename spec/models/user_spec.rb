require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates user if length of name is >= 3' do
    user = User.new(name: 'test_user')
    expect(user.valid?).to be true
  end

  it "doesn't validate user if length of name is < 3" do
    user = User.new(name: 'tt')
    expect(user.valid?).to be false
  end
end
