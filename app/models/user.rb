require 'bcrypt'

class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
    has_many :blogs, dependent: :destroy

    has_many :followed_users, foreign_key: :follower_id, class_name: 'Follower'
    has_many :followees, through: :followed_users
    has_many :following_users, foreign_key: :followee_id, class_name: 'Follower'
    has_many :followers, through: :following_users
end
