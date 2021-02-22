require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  describe 'current user' do
    before(:example) do
      @user = User.create(name: 'test_user', password: '123456')
    end
    it 'returns current user' do
      log_in(@user)
      expect(current_user).to eq @user
    end
    it 'returns nil if user not logged_in' do
      expect(current_user).to be nil
    end
  end
  describe 'logged in' do
    before(:example) do
      @user = User.create(name: 'test_user', password: '123456')
    end
    it 'returns true if user logged in' do
      log_in(@user)
      expect(logged_in?).to be true
    end
    it 'returns false if user not logged in' do
      expect(logged_in?).to be false
    end
  end
end
