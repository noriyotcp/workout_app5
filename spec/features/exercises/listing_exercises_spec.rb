require 'rails_helper'

RSpec.feature "Exercises::ListingExercises", type: :feature do
  let!(:user) { create(:user) }
  before { login_as(user) }

  let!(:exercise1) { user.exercises.create(duration_in_min: 20,
                                          workout: 'My body building activity',
                                          workout_date: Date.today) }
  let!(:exercise2) { user.exercises.create(duration_in_min: 55,
                                          workout: 'Weight lifting',
                                          workout_date: 2.days.ago) }
  let!(:exercise3) { user.exercises.create(duration_in_min: 50,
                                          workout: 'On treadmill',
                                          workout_date: 8.days.ago) }

  subject { page }

  scenario "shows user's workout for last 7 days" do
    visit '/'
    click_link 'My Lounge'

    is_expected.to have_content(exercise1.duration_in_min)
    is_expected.to have_content(exercise1.workout)
    is_expected.to have_content(exercise1.workout_date)

    is_expected.to have_content(exercise2.duration_in_min)
    is_expected.to have_content(exercise2.workout)
    is_expected.to have_content(exercise2.workout_date)

    is_expected.not_to have_content(exercise3.duration_in_min)
    is_expected.not_to have_content(exercise3.workout)
    is_expected.not_to have_content(exercise3.workout_date)
  end

  scenario 'shows no exercises if none created' do
    user.exercises.delete_all

    visit '/'
    click_link 'My Lounge'

    is_expected.to have_content 'No Workouts Yet'
  end

  let(:target) { create(:user) }
  scenario "shows a list of user's friends" do
    Friendship.create(user: user, friend: target)

    visit '/'
    click_link 'My Lounge'

    is_expected.to have_content("My Friends")
    is_expected.to have_link(target.full_name)
    is_expected.to have_link("Unfollow")
  end
end
