require 'rails_helper'

RSpec.feature 'User chooses topics that they are strong in' do
  scenario 'and they see the topics they chose' do
    user = create(:user)
    topics = create_list(:topic, 3)
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(user)

    visit edit_user_path(user)

    check topics.first.name
    check topics.last.name

    click_on 'Submit Changes'

    expect(User.first.topics).to eq([Topic.first, Topic.last])
    
    within('div.strong-topics') do
      expect(page).to have_content topics.first.name
      expect(page).to have_content topics.last.name
      expect(page).to_not have_content topics[1].name
    end
  end
end
