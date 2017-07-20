require 'rails_helper'

RSpec.feature 'Admin deletes a user' do
  scenario 'and the deleted user is gone' do
    users = create_list(:user, 3)
    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(admin)

    visit admin_users_path
    expect(User.count).to eq 4
    expect(page).to have_content users.first.name
    expect(page).to have_content users.last.name

    click_on 'Delete', match: :first

    within('.table') do
      expect(page).to_not have_content users.first.name
    end
    
    expect(page).to have_content users.last.name
    expect(User.count).to eq 3
  end
end
