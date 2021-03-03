require 'rails_helper'

RSpec.describe Opinion, type: :model do
  context 'Associations' do
    it { should belong_to(:author) }
  end

  context 'Validations' do
    it { should validate_presence_of(:author_id) }
    it { should validate_presence_of(:text) }
    it { should validate_length_of(:text).is_at_most(140) }
  end
end
