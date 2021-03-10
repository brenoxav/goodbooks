require 'rails_helper'

RSpec.describe Following, type: :model do
  context 'Associations' do
    it { should belong_to(:follower) }
    it { should belong_to(:followed) }
  end

  context 'Validations' do
    it { should validate_presence_of(:follower_id) }
    it { should validate_presence_of(:followed_id) }
  end
end
