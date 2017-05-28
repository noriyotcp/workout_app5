require 'rails_helper'

RSpec.feature "Friendships::UnfollowingFriends", type: :feature do
  let!(:user) { create(:user) }
  let!(:friend) { create(:user) }
  let(:friendship) { Friendship.create(user: user, friend: friend) }

  before { login_as(user) }

  scenario "when clicking Unfollow link" do
    link = "a[href='/friendships/#{friendship.id}'][data-method='delete']"

    visit '/'
    click_link 'My Lounge'
    find(link).click

    expect(page).to have_content(friend.full_name + ' unfollowed')
  end
end
