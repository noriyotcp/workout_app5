# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :exercises
  has_many :friendships
  has_many :friends, through: :friendships, class_name: 'User'

  validates :first_name, presence: true
  validates :last_name, presence: true

  self.per_page = 10

  def full_name
    [first_name, last_name].join(" ")
  end

  def self.search_by_name(name)
    names_array = name.split(' ')

    if names_array.size == 1
      where('first_name LIKE ? or last_name LIKE ?',
            "%#{names_array[0]}%", "%#{names_array[0]}%")
    else
      where('first_name LIKE ? or last_name LIKE ? or last_name LIKE ? or first_name LIKE ?',
            "%#{names_array[0]}%", "%#{names_array[0]}%", "%#{names_array[1]}%", "%#{names_array[1]}%")
            .order(:first_name)
    end
  end

  def follows_or_same?(new_friend)
    friendships.map(&:friend).include?(new_friend) || self == new_friend
  end
end
