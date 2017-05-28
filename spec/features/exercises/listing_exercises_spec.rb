require 'rails_helper'

RSpec.feature "Exercises::ListingExercises", type: :feature do
  let!(:john) { create(:user) }
  let!(:sarah) { create(:user) }
  before { login_as(john) }

  let!(:exercise1) { john.exercises.create(duration_in_min: 20,
                                          workout: 'My body building activity',
                                          workout_date: Date.today) }
  let!(:exercise2) { john.exercises.create(duration_in_min: 55,
                                          workout: 'Weight lifting',
                                          workout_date: 2.days.ago) }
  let!(:exercise3) { john.exercises.create(duration_in_min: 50,
                                          workout: 'On treadmill',
                                          workout_date: 8.days.ago) }

  scenario "shows user's workout for last 7 days" do
    visit '/'
    click_link 'My Lounge'

    expect(page).to have_content(exercise1.duration_in_min)
    expect(page).to have_content(exercise1.workout)
    expect(page).to have_content(exercise1.workout_date)

    expect(page).to have_content(exercise2.duration_in_min)
    expect(page).to have_content(exercise2.workout)
    expect(page).to have_content(exercise2.workout_date)

    expect(page).not_to have_content(exercise3.duration_in_min)
    expect(page).not_to have_content(exercise3.workout)
    expect(page).not_to have_content(exercise3.workout_date)
  end

  scenario 'shows no exercises if none created' do
    john.exercises.delete_all

    visit '/'
    click_link 'My Lounge'

    expect(page).to have_content 'No Workouts Yet'
  end

  scenario "shows a list of user's friends" do
    Friendship.create(user: john, friend: sarah)

    visit '/'
    click_link 'My Lounge'

    expect(page).to have_content("My Friends")
    expect(page).to have_link(sarah.full_name)
    expect(page).to have_link("Unfollow")
  end
end
