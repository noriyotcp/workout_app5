# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_rooms_on_user_id  (user_id)
#

class Room < ApplicationRecord
  belongs_to :user
  has_many :messages
end
