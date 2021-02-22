require 'rails_helper'

RSpec.describe UsersHelper, type: :helper do
  describe 'display avatar' do
    before(:example) do
      @user = User.create(name: 'test_user')
    end
    it 'displays default avatar if avatar is not provided' do
      expect(display_avatar(@user)).to eq(image_tag('default-avatar.png', class: 'avatar rounded-circle'))
    end
    it 'displays custom avatar if avatar is provided' do
      @user.avatar.attach(io: File.open('spec/test.png'), filename: 'test.png', content_type: 'image/png')
      expect(display_avatar(@user)).not_to eq(image_tag('default-avatar.png', class: 'avatar rounded-circle'))
    end
  end
end
