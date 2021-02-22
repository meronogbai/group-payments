require 'rails_helper'

RSpec.describe GroupsHelper, type: :helper do
  describe 'display icon' do
    before(:example) do
      @user = User.create(name: 'test_user')
      @group = Group.create(name: 'test_group', user_id: @user.id)
    end
    it 'displays default icon if icon is not provided' do
      expect(display_icon(@group)).to eq(image_tag('default-group-icon.png', class: 'group-img'))
    end
    it 'displays custom icon if icon is provided' do
      @group.icon.attach(io: File.open('spec/test.png'), filename: 'test.png', content_type: 'image/png')
      expect(display_icon(@group)).not_to eq(image_tag('default-group-icon.png', class: 'group-img'))
    end
  end
end
