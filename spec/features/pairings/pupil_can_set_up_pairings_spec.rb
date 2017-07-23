require 'rails_helper'

RSpec.feature 'Pupil visits a tutor page and sets up a pairing' do
  scenario 'and sees the new pairing, which is deleted from the dropdown' do
    tutor = create(:tutor, :with_dates, date_count: 3)
    tutor.topics << create_list(:topic, 3)
    user = create(:user)
    topic = tutor.topics.last
    date1 = tutor.tutor_dates[0].formatted_date
    date2 = tutor.tutor_dates[1].formatted_date
    date3 = tutor.tutor_dates.last
    message = "Pairing with #{tutor.name} at #{date3.formatted_date} for #{date3.duration}"

    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(user)

    visit user_path(tutor)

    select topic.name, from: 'pairing[topic_id]'
    select date3.formatted_date, from: 'pairing[tutor_date_id]'

    click_on 'Book Pairing'

    expect(page).to have_content 'Pairing booked successfully'
    expect(page).to have_select("pairing[tutor_date_id]",
                 options: [date1, date2])

    visit user_path(user)

    expect(page).to have_content message
  end
end
