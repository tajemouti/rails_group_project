require 'rails_helper'

RSpec.describe Recipe, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:recipe_foods).dependent(:destroy) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:preparation_time) }
    it { is_expected.to validate_presence_of(:cooking_time) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
