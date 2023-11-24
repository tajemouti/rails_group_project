require 'rails_helper'

RSpec.describe 'Recipe show page', type: :feature do
  describe 'recipe' do
    before :each do
      @user1 = User.create!(name: 'Tajemouti', email: 'tajemouti@gmail.com', password: '123456')
      @user2 = User.create!(name: 'Newton', email: 'newton@gmail.com', password: '123456')
      @user3 = User.create!(name: 'Ngala', email: 'ngala@gmail.com', password: '123456')

      visit '/users/sign_in'
      fill_in 'Email', with: 'tajemouti@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'

      @recipe = @user1.recipes.create!(name: 'Recipe 01', cooking_time: '10 min', preparation_time: '10 min',
                                       description: 'Recipe description.')
      visit recipes_path
    end

    it 'should have the following content' do
      expect(page).to have_content('Recipe 01')
      expect(page).to have_content('Recipe description.')
      expect(page).to have_link('Remove')
    end

    it 'should link up to the show page' do
      click_link 'Recipe 01'
      expect(current_path).to eq(recipe_path(@recipe))
    end
  end

  describe 'recipe show' do
    before :each do
      @user1 = User.create!(name: 'Tajemouti', email: 'tajemouti@gmail.com', password: '123456')
      @user2 = User.create!(name: 'Newton', email: 'newton@gmail.com', password: '123456')
      @user3 = User.create!(name: 'Ngala', email: 'ngala@gmail.com', password: '123456')

      visit '/users/sign_in'
      fill_in 'Email', with: 'tajemouti@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'

      @recipe = @user1.recipes.create!(name: 'Recipe 01', cooking_time: '10 min', preparation_time: '10 min',
                                       description: 'Recipe description.')
      visit recipe_path(@recipe)
    end

    it 'should have the following content' do
      expect(page).to have_content('Recipe 01')
      expect(page).to have_content('Preparation time: 10 min')
      expect(page).to have_content('Cooking time: 10 min')
      expect(page).to have_content('Public')
      expect(page).to have_content('No ingredients added yet.')
    end
  end
end
