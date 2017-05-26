require 'rails_helper'

RSpec.feature "Followings::FollowingFriends", type: :feature do
  let!(:user) { create(:user) }
  let!(:target) { create(:user) }

  before { login_as(user) }

  scenario 'if signed in' do
    visit '/'

    expect(page).to have_content(user.full_name)
    expect(page).to have_content(target.full_name)

    href = "/friendships?friend_id=#{user.id}"
    expect(page).not_to have_link("Follow", href: href)

    link = "a[href='/friendships?friend_id=#{target.id}']"
    find(link).click
  end
end
