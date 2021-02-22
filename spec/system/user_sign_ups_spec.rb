require 'rails_helper'

RSpec.describe 'UserSignUps', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'signs up user' do
    visit root_url
    click_link_or_button 'Signup'
    fill_in 'user[name]', with: 'test_user'
    fill_in 'user[password]', with: '123456'
    click_link_or_button 'Signup'
    expect(page).to have_css('img.avatar', count: 1)
  end

  it "can't sign up user that already exists" do
    user = User.create(name: 'test_user', password: '123456')
    visit root_url
    click_link_or_button 'Signup'
    fill_in 'user[name]', with: user.name
    fill_in 'user[password]', with: '123456'
    click_link_or_button 'Signup'
    expect(page).not_to have_css('img.avatar', count: 1)
    expect(page).to have_css('.alert.alert-danger', count: 1)
  end
end
