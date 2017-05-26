require 'rails_helper'

RSpec.feature "Dashboards::SearchingForUsers", type: :feature do
  let!(:john) { create(:user, first_name: 'John', last_name: 'Doe') }
  let!(:sarah) { create(:user, first_name: 'Sarah', last_name: 'Doe') }
  let!(:unsearchable) { create(:user, first_name: 'Unsearch', last_name: 'Able') }

  scenario 'with existing name returns all those users' do
    visit '/'

    fill_in 'search_name', with: 'Doe'
    click_button 'Search'

    expect(page).to have_content(john.full_name)
    expect(page).to have_content(sarah.full_name)
    expect(page).not_to have_content(unsearchable.full_name)
    expect(current_path).to eq '/dashboards/search'
  end
end
