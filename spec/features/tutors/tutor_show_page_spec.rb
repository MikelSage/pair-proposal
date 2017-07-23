require 'rails_helper'

RSpec.feature 'Tutor vists their show page' do
  scenario 'and sees only their open dates' do
    tutor = create(:tutor, :with_dates, date_count: 3)
    user = create(:user)
    topic = create(:topic)
    date1 = tutor.tutor_dates[0].formatted_date
    date2 = tutor.tutor_dates[1].formatted_date
    date3 = tutor.tutor_dates[2].formatted_date
    pairing = create(:pairing, pupil_id: user.id, tutor_id: tutor.id,
                     topic_id: topic.id, tutor_date_id: tutor.tutor_dates.last.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(tutor)

    visit edit_user_path(tutor)

    expect(page).to have_content date1
    expect(page).to have_content date2
    expect(page).to_not have_content date3
  end
end
