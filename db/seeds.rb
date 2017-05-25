# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

test1 = User.create!(email: 'test1@example.com', password: 'password', password_confirmation: 'password')
test1.exercises.create(duration_in_min: 20,
                                        workout: 'My body building activity',
                                        workout_date: Date.today)
test1.exercises.create(duration_in_min: 55,
                                        workout: 'Weight lifting',
                                        workout_date: 2.days.ago)
test1.exercises.create(duration_in_min: 50,
                                          workout: 'On treadmill',
                                          workout_date: 8.days.ago)
