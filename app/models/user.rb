class User < ApplicationRecord
  validates :username, presence: true, length: { maximum: 15 }
  validates :username, presence: true, length: { maximum: 50 }

  has_many :opinions, foreign_key: :author_id
end
