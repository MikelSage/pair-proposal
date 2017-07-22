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
    save_and_open_page
    fill_in 'Duration', with: duration
    click_on 'Submit'

    expect(page).to have_content 'Jul 22, 2017 at 6:30'
    expect(page).to have_content duration
  end
end
