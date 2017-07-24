require 'rails_helper'

RSpec.feature 'User visits the find tutor page' do
  scenario 'and the see a list of the tutors strong in that topic' do
    user = create(:user)
    tutor = create(:tutor)
    tutor.topics << create_list(:topic, 3)
    tutor2 = create(:tutor)
    tutor2.topics << tutor.topics.last
    tutor3 = create(:tutor)
    tutor3.topics << create(:topic)
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(user)

    visit tutors_path

    select tutor.topics.last.name, from: 'tutor_topic_id'
    click_on 'Find Tutors'

    expect(page).to have_content tutor.name
    expect(page).to have_content tutor2.name
    expect(page).to_not have_content tutor3.name
  end
end
