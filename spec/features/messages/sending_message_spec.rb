require 'rails_helper'

RSpec.feature "Messages::SendingMessage", type: :feature do
  let!(:owner) { create(:user) }
  let!(:friend1) { create(:user, first_name: 'First', last_name: 'Friends') }
  let!(:friend2) { create(:user, first_name: 'Second', last_name: 'Friends') }
  let(:room_name) { owner.room.name }

  before do
    login_as(owner)
    create(:friendship, user: owner, friend: friend1)
    create(:friendship, user: owner, friend: friend2)
  end

  subject { page }

  scenario "to followers shows in chatroom window" do
    visit '/'
    click_link 'My Lounge'
    is_expected.to have_content(room_name)

    fill_in 'message-field', with: 'Hello'
    click_button 'Post'

    is_expected.to have_content 'Hello'

    within('#followers') do
      is_expected.to have_link(friend1.full_name)
      is_expected.to have_link(friend2.full_name)
    end
  end
end
