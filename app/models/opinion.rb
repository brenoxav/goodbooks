class Opinion < ApplicationRecord
  validates :author_id, presence: true
  validates :text, presence: true, length: { maximum: 140 }

  belongs_to :author, class_name: 'User'

  #TODO Reevaluate necessity of scope "latest"
  scope :latest, -> { Opinion.limit(5).order(created_at: :desc) }
end
