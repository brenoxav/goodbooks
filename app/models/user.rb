class User < ApplicationRecord
  validates :username, presence: true, length: { maximum: 15 }
  validates :username, presence: true, length: { maximum: 50 }
end
