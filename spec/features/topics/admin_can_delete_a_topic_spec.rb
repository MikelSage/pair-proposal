require 'rails_helper'

RSpec.feature 'Admin deletes a topic' do
  scenario 'and the topic is gone from the list' do
    admin = create(:admin)
    topic1, topic2 = create_list(:topic, 2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(admin)

    visit admin_topics_path

    expect(page).to have_link topic1.name
    expect(page).to have_link topic2.name

    click_on 'Delete', match: :first

    expect(page).to_not have_link topic1.name
    expect(page).to have_link topic2.name
    expect(page).to have_content "#{topic1.name} deleted successfully!"
  end
end
