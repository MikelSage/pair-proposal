require 'rails_helper'

RSpec.feature 'Admin creates a topic' do
  scenario 'and sees their new topic in the index' do
    admin = create(:admin)
    topic = 'Sorting Suite'

    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(admin)

    visit new_admin_topic_path
    fill_in 'Name', with: topic
    click_on 'Create Topic'

    expect(current_path).to eq admin_topics_path
    expect(page).to have_content topic
    expect(page).to have_content "#{topic} created successfully!"
  end
end
