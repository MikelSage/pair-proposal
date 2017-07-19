require 'rails_helper'

RSpec.feature 'User edits their information' do
  scenario 'and sees the updated information' do
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

    click_on 'Edit Info'

    fill_in 'user[name]', with: 'New Name'
    fill_in 'user[bio]', with: 'New Bio'
    click_on 'Submit Changes'

    expect(page).to have_content 'New Name'
    expect(page).to have_content 'New Bio'
  end
end
