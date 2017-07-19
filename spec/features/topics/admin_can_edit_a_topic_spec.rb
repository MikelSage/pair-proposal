require 'rails_helper'

RSpec.feature 'Admin edits a topic spec' do
  scenario 'and sees the updated information' do
    topics = create_list(:topic, 3)
    name = 'Diff Topic'
    admin = create(:admin)

    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(admin)

    visit admin_topics_path
    click_on topics.last.name

    fill_in 'Name', with: name
    click_on 'Update Topic'

    expect(current_path).to eq admin_topics_path
    expect(page).to have_content name
  end
end
