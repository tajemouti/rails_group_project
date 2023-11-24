require 'rails_helper'

RSpec.describe 'Recipe index page', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Tajemouti', email: 'tajemouti@gmail.com', password: '123456')
    @user2 = User.create!(name: 'Newton', email: 'newton@gmail.com', password: '123456')
    @user3 = User.create!(name: 'Ngala', email: 'ngala@gmail.com', password: '123456')

    visit '/users/sign_in'
    fill_in 'Email', with: 'ngala@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    visit recipes_path
  end

  it 'should have the following content' do
    expect(page).to have_content('Hi Ngala')
    expect(page).to have_content('Recipe List')
    expect(page).to have_link('Foods')
    expect(page).to have_link('Recipes')
    expect(page).to have_link('Inventories')
  end

  it 'should link up to page to add new recipe' do
    click_link 'Add Recipe'
    expect(current_path).to eq(new_recipe_path)
  end

  it 'should link up to the inventories list page' do
    click_link 'Inventories'
    expect(current_path).to eq(inventories_path)
  end

  it 'should link up to the foods list page' do
    click_link 'Foods'
    expect(current_path).to eq(foods_path)
  end
end
