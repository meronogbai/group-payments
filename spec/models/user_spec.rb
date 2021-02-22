require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates user if length of name is >= 3' do
    user = User.new(name: 'test_user', password: '123456')
    expect(user.valid?).to be true
  end

  it "doesn't validate user if length of name is < 3" do
    user = User.new(name: 'tt', password: '123456')
    expect(user.valid?).to be false
  end

  it "doesn't validates user if password length is less than 6"  do
    user = User.new(name: 'test_user', password: '12345')
    expect(user.valid?).to be false
  end

  it 'validates user if password length is greater than or equal to 6'  do
    user = User.new(name: 'test_user', password: '1234567')
    expect(user.valid?).to be true
  end

  it "doesn't validate user if name already exists" do
    user1 = User.create!(name: 'test_user', password: '1234567')
    user2 = User.new(name: 'test_user', password: '1234567')
    expect(user2.valid?).to be false
  end
end
