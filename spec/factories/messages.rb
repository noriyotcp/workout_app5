# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  room_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_messages_on_room_id  (room_id)
#  index_messages_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :message do
    body "MyText"
    user
    room
  end
end
