# == Schema Information
#
# Table name: friendships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  friend_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_friendships_on_friend_id  (friend_id)
#  index_friendships_on_user_id    (user_id)
#

FactoryGirl.define do
  factory :friendship do
    user User.first
    sequence :friend do |n|
      # form a friendship with other users
      User.find(n+1) # from id: 2
    end
  end
end
