class Opinion < ApplicationRecord
  validates :author_id, presence: true
  validates :text, presence: true, length: { maximum: 140 }

  belongs_to :author, class_name: 'User'

  scope :latest_opinions, -> { order(created_at: :desc).last(5) }
end
