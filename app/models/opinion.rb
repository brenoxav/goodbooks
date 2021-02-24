class Opinion < ApplicationRecord
  validates :author_id, presence: true
  validates :text, presence: true, length: { maximum: 140 }
end
