require 'rails_helper'

RSpec.feature "Exercises::DeletingExercise", type: :feature do
  let!(:owner) { User.create!(email: 'owner@example.com', password: 'password') }
  let!(:owner_exercise) { owner.exercises.create!(duration_in_min: 48,
                                            workout: 'My body building activity',
                                            workout_date: Date.today) }
  before { login_as(owner) }

  scenario 'delete an exercise' do
    visit '/'

    click_link 'My Lounge'

    link = "a[href='/users/#{owner.id}/exercises/#{owner_exercise.id}'][data-method='delete']"
    find(:css, link).click

    expect(page).to have_content("Exercise has been deleted")
  end
end
