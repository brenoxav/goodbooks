require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Associations' do
    it { should have_many(:opinions) }
    it { should have_many(:followers) }
    it { should have_many(:followeds) }
  end

  context 'Validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:full_name) }
    it { should validate_length_of(:username).is_at_most(15) }
    it { should validate_length_of(:full_name).is_at_most(50) }
  end
end
