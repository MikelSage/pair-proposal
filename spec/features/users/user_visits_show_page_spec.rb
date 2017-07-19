require 'rails_helper'

RSpec.feature 'User visits their account page' do
  scenario 'and they see their information' do
    password = 'password'
    user = create(:user, password: password)

    visit login_path

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: password
    click_button 'Login'

    expect(page).to have_content user.name
    expect(page).to have_content user.username
    expect(page).to have_content user.bio
  end
end
