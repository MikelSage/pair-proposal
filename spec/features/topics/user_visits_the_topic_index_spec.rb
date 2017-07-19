require 'rails_helper'

RSpec.feature 'User visits the topics index' do
  context 'as an admin' do
    scenario 'should display all topics on page' do
      admin = create(:admin)
      topics = create_list(:topic, 3)

      allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(admin)

      visit admin_topics_path
      expect(page).to have_content 'All Topics'
      expect(page).to have_content topics.last.name
    end
  end

  context 'as a default user' do
    scenario 'should render 404 instead' do
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).
      and_return(user)

      visit admin_topics_path
      expect(page).to_not have_content 'Admin Categories'
      expect(page).to have_content "The page you were looking for doesn't exist."
    end
  end
end
