require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:example) do
    @user = User.create(name: 'test_user')
  end

  it "doesn't validate group with short name" do
    group = Group.new(name: 'ha', user_id: @user.id)
    expect(group.valid?).to be false
  end

  it "doesn't validate group if user doesn't exist" do
    group = Group.new(name: 'ha', user_id: 9)
    expect(group.valid?).to be false
  end

  it 'validates group with name with length >= 3 and existing user' do
    group = Group.new(name: 'haha', user_id: @user.id)
    expect(group.valid?).to be true
  end
end
