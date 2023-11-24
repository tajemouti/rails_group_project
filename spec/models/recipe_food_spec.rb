require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:recipe) }
    it { is_expected.to belong_to(:food) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:quantity) }
    it do
      is_expected.to validate_numericality_of(:quantity)
        .only_integer
        .is_greater_than_or_equal_to(0)
    end
  end
end
