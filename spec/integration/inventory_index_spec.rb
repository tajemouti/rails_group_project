require 'rails_helper'

RSpec.describe 'Inventory index page', type: :feature do
  before :each do
    @user1 = User.create!(name: 'Tajemouti', email: 'tajemouti@gmail.com', password: '123456')
    @user2 = User.create!(name: 'Newton', email: 'newton@gmail.com', password: '123456')
    @user3 = User.create!(name: 'Ngala', email: 'ngala@gmail.com', password: '123456')

    visit '/users/sign_in'
    fill_in 'Email', with: 'tajemouti@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    visit '/inventories'
  end

  it 'should have the following content' do
    expect(page).to have_content('Hi Tajemouti')
    expect(page).to have_content('Inventory List')
    expect(page).to have_link('Foods')
    expect(page).to have_link('Recipes')
    expect(page).to have_link('Inventories')
    expect(page).to have_content('No inventories yet. Please add an inventory.')
  end

  it 'should link up to page to add new inventory' do
    click_link 'Add Inventory'
    expect(current_path).to eq(new_inventory_path)
  end

  it 'should link up to the recipes list page' do
    click_link 'Recipes'
    expect(current_path).to eq(recipes_path)
  end

  it 'should link up the foods list page' do
    click_link 'Foods'
    expect(current_path).to eq(foods_path)
  end
end