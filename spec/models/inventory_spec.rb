require 'rails_helper'

RSpec.describe Inventory, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:inventory_foods).with_foreign_key(:inventory_id).dependent(:destroy) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
