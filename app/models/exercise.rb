# == Schema Information
#
# Table name: exercises
#
#  id              :integer          not null, primary key
#  duration_in_min :integer
#  workout         :text
#  workout_date    :date
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_exercises_on_user_id  (user_id)
#

class Exercise < ApplicationRecord
  belongs_to :user

  alias_attribute :workout_details, :workout
  alias_attribute :activity_date, :workout_date

  validates :duration_in_min, numericality: { greater_than: 0.0 }
  validates :workout_details, presence: true
  validates :activity_date, presence: true
end
