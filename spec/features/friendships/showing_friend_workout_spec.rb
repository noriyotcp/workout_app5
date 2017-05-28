require 'rails_helper'

RSpec.feature "Friendships::ShowingFriendWorkout", type: :feature do
  let!(:user) { create(:user) }
  let!(:friend) { create(:user) }

  let!(:users_exercise) { user.exercises.create(duration_in_min: 74,
                                               workout: 'My body building activity',
                                               workout_date: Date.today) }

  let!(:friends_exercise) { friend.exercises.create(duration_in_min: 55,
                                               workout: 'Weight lifting',
                                               workout_date: Date.today) }
  subject { page }
  before { login_as(user) }

  scenario "shows friend's workout for last 7 days" do
    Friendship.create(user: user, friend: friend)

    visit '/'
    click_link 'My Lounge'
    click_link friend.full_name

    is_expected.to have_content(friend.full_name + "'s Exercises")
    is_expected.to have_content(friends_exercise.workout)
    is_expected.to have_css("div#chart")
  end
end
