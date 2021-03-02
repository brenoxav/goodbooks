class User < ApplicationRecord
  validates :username, presence: true, length: { maximum: 15 }
  validates :full_name, presence: true, length: { maximum: 50 }

  has_many :opinions, foreign_key: :author_id, dependent: :delete_all

  # User is "Follower" of other Users
  # User has many "users as followers" and has many "followings as received_followings"
  has_many :received_followings, foreign_key: :followed_id, class_name: 'Following', dependent: :delete_all
  has_many :followers, through: :received_followings, source: :follower, dependent: :delete_all


  # User is "Followed" by other Users
  # User has many "users as followeds" and has many "followings as submitted_followings"
  has_many :submitted_followings, foreign_key: :follower_id, class_name: 'Following', dependent: :delete_all
  has_many :followeds, through: :submitted_followings, source: :followed, dependent: :delete_all


  def is_follower_of?(followed_user)
    self.followeds.any? { |followed| followed == followed_user }
  end

  def is_followed_by?(follower_user)
    self.followers.any? { |follower| follower == follower_user }
  end

  #TODO Exclude current_user from 'latest_users' method
  def latest_users
    User.order(full_name: :desc).last(5)
  end

  after_initialize :set_defaults

  def set_defaults
    self.photo ||= "default-profile-photo.png"
    self.cover_image ||= "default-cover-image.jpg"
  end
end
