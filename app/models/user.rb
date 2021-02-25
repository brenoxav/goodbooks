class User < ApplicationRecord
  validates :username, presence: true, length: { maximum: 15 }
  validates :full_name, presence: true, length: { maximum: 50 }

  has_many :opinions, foreign_key: :author_id

  # User is "Follower" of other Users
  # User has many "users as followers" and has many "followings as received_followings"
  has_many :received_followings, foreign_key: :followed_id, class_name: 'Following', dependent: :destroy
  has_many :followers, through: :received_followings, source: :follower, dependent: :destroy


  # User is "Followed" by other Users
  # User has many "users as followeds" and has many "followings as submitted_followings"
  has_many :submitted_followings, foreign_key: :follower_id, class_name: 'Following', dependent: :destroy
  has_many :followeds, through: :submitted_followings, source: :followed, dependent: :destroy


  def is_follower_of?(followed_user)
    self.followeds.any? { |followed| followed == followed_user }
  end

  def is_followed_by?(follower_user)
    self.followers.any? { |follower| follower == follower_user }
  end
end
