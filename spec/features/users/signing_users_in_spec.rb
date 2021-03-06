require 'rails_helper'

RSpec.feature "Users::SigningUsersIn", type: :feature do
  let(:john) { create(:user) }

  scenario 'Users sign in' do
    visit '/'
    click_link 'Sign in'

    fill_in 'Email', with: john.email
    fill_in 'Password', with: john.password

    click_button 'Log in'

    expect(page).to have_content 'Signed in successfully'
    expect(page).to have_content "Signed in as #{john.email}"
  end
end
