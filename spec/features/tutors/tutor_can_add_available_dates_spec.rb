require 'rails_helper'

RSpec.feature 'Tutor visits edit page' do
  scenario 'and can add times that they are free' do
    tutor = create(:tutor)
    datetime = '2017-07-22T18:30'
    duration = '30'
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(tutor)

    visit edit_user_path(tutor)

    fill_in 'tutor_date[date]', with: datetime
    fill_in 'Duration', with: duration
    click_on 'Submit'

    expect(page).to have_content 'Jul 22, 2017 at 6:30'
    expect(page).to have_content duration
  end

  scenario 'and they can remove dates from the list' do
    tutor = create(:tutor, :with_dates, date_count: 3)
    date = tutor.tutor_dates.first
    allow_any_instance_of(ApplicationController).to receive(:current_user).
    and_return(tutor)

    visit edit_user_path(tutor)

    tutor.tutor_dates.each do |tutor_date|
      expect(page).to have_content tutor_date.formatted_date
    end

    click_on 'Delete Date', match: :first

    expect(page).to have_content 'Date deleted successfully'
    expect(page).to_not have_content date.formatted_date
  end
end
