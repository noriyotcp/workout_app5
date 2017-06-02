# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times { FactoryGirl.create(:user) }

user = User.first
user.exercises.create(duration_in_min: 20,
                                        workout: 'My body building activity',
                                        workout_date: Date.today)
user.exercises.create(duration_in_min: 55,
                                        workout: 'Weight lifting',
                                        workout_date: 2.days.ago)
user.exercises.create(duration_in_min: 50,
                                          workout: 'On treadmill',
                                          workout_date: 8.days.ago)

(User.count - 1).times { FactoryGirl.create(:friendship) }

john = FactoryGirl.create(:user, first_name: 'John', last_name: 'Doe', email: 'john@example.com')
jane = FactoryGirl.create(:user, first_name: 'Jane', last_name: 'Doe', email: 'jane@example.com')
FactoryGirl.create(:friendship, user: john, friend: jane)
FactoryGirl.create(:friendship, user: jane, friend: john)
