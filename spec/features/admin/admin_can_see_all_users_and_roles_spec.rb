require 'rails_helper'

RSpec.feature 'Admin visits the users index' do
  scenario 'and they see all the users and their roles' do
    users = create_list(:user, 3)
    tutors = create_list(:tutor, 2)
    admin = create(:admin)

    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(admin)

    visit admin_users_path

    users.each do |user|
      expect(page).to have_content(user.name)
    end

    tutors.each do |tutor|
      expect(page).to have_content(tutor.name)
    end

    expect(page).to have_content 'pupil'
    expect(page).to have_content 'tutor'
  end
end
