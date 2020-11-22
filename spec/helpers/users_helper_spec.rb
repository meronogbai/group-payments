require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
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
