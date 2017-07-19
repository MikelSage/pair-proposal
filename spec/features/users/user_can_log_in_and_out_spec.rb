require "rails_helper"

RSpec.feature "User logs in and out" do
  scenario "with valid credentials" do
    password = 'jjdabest'
    user = create(:user, password: password)

    visit login_path
    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: password

    click_button "Login"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_content('Login Successful')

    click_on "Logout"

    expect(current_path).to eq(root_path)
    expect(page).to_not have_content("#{user.username}")
    expect(page).to have_content("Logout Successful")
  end
end
