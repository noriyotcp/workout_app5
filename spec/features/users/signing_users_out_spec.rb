require 'rails_helper'

RSpec.feature "Users::SigningUsersOut", type: :feature do
  let(:john) { create(:user) }
  before do
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: john.email
    fill_in 'Password', with: john.password
    click_button 'Log in'
  end

  scenario 'Sign out' do
    visit '/'
    click_link 'Sign out'
    expect(page).to have_content('Signed out successfully.')
  end
end
