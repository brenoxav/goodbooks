class User < ApplicationRecord
  validates :username, presence: true, length: { maximum: 15 }
  validates :full_name, presence: true, length: { maximum: 50 }

  has_many :opinions, foreign_key: :author_id, dependent: :delete_all

  has_many :received_followings, foreign_key: :followed_id, class_name: 'Following', dependent: :delete_all
  has_many :followers, through: :received_followings, source: :follower, dependent: :delete_all

  has_many :submitted_followings, foreign_key: :follower_id, class_name: 'Following', dependent: :delete_all
  has_many :followeds, through: :submitted_followings, source: :followed, dependent: :delete_all

  def follower_of?(followed_user)
    followeds.any? { |followed| followed == followed_user }
  end

  def followed_by?(follower_user)
    followers.any? { |follower| follower == follower_user }
  end

  def follow_suggestions
    User.order(created_at: :desc).last(5).filter{ |u| !u.followed_by?(self) && u != self }
  end

  after_initialize :set_defaults

  def set_defaults
    self.photo ||= 'default-profile-photo.png'
    self.cover_image ||= 'default-cover-image.jpg'
  end
end
