require 'rails_helper'

RSpec.feature 'User edits their information' do
  scenario 'and sees the updated information' do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(user)

    visit user_path(user)

    click_on 'Edit Info'

    fill_in 'user[name]', with: 'New Name'
    fill_in 'user[bio]', with: 'New Bio'
    click_on 'Submit Changes'

    expect(page).to have_content 'New Name'
    expect(page).to have_content 'New Bio'
  end
end
