require 'rails_helper'

RSpec.feature 'User creates a new account' do
  scenario 'with valid attributes' do
    user_attributes = {
      username: 'jjboy',
      password: 'jjdabest',
      name: 'Johny'
    }

    visit new_user_path

    fill_in "user[username]", with: user_attributes[:username]
    fill_in "user[password]", with: user_attributes[:password]
    fill_in "user[name]", with: user_attributes[:password]
    click_on "Create Account"

    user = User.last

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_content("Logout")
  end
end
