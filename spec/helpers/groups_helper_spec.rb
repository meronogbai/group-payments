require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the GroupsHelper. For example:
#
# describe GroupsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
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
