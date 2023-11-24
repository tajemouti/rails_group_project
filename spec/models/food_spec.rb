require 'rails_helper'

RSpec.describe Food, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:inventory_foods).dependent(:destroy) }
    it { is_expected.to have_many(:recipe_foods).dependent(:destroy) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:food) }
    it { is_expected.to validate_presence_of(:measurement_unit) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_numericality_of(:price).only_integer.is_greater_than_or_equal_to(0) }
  end
end
