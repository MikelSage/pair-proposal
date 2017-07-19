require 'rails_helper'

RSpec.feature 'User visits their account page' do
  scenario 'and they see their information' do
    user_params = {
      name: 'Dat Boi',
      username: 'herecomes21',
      password: 'password',
      bio: 'Oh shiit waddup?'
    }

    user = User.create(user_params)

    visit login_path
    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user_params[:password]
    click_button 'Login'

    expect(page).to have_content user.name
    expect(page).to have_content user.username
    expect(page).to have_content user.bio
  end
end
