require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:foods).with_foreign_key(:user_id).dependent(:destroy) }
    it { is_expected.to have_many(:recipes).with_foreign_key(:user_id).dependent(:destroy) }
    it { is_expected.to have_many(:inventories).with_foreign_key(:user_id).dependent(:destroy) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
  end
end
