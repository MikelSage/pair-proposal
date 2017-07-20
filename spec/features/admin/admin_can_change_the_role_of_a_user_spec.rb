require 'rails_helper'

RSpec.feature 'Admins changes the role of a user' do
  scenario 'and sees the updated role' do
    user = create(:user)
    admin = create(:admin)

    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(admin)

    visit edit_admin_user_path(user)

    expect(user.role).to eq('pupil')

    select 'tutor', from: 'user[role]'
    click_on 'Update User'

    expect(current_path).to eq admin_user_path(user)
    expect(User.first.role).to eq('tutor')
    expect(page).to have_content user.name
    expect(page).to have_content 'tutor'
    expect(page).to_not have_content 'pupil'
  end
end
