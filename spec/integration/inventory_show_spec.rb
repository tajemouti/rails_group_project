require 'rails_helper'

RSpec.describe 'Recipe show page', type: :feature do
  describe 'recipe' do
    before :each do
      @user1 = User.create!(name: 'Tajemouti', email: 'tajemouti@gmail.com', password: '123456')
      @user2 = User.create!(name: 'Newton', email: 'newton@gmail.com', password: '123456')
      @user3 = User.create!(name: 'Ngala', email: 'ngala@gmail.com', password: '123456')

      visit '/users/sign_in'
      fill_in 'Email', with: 'newton@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'

      @inventory = @user2.inventories.create!(name: 'Inventory 01', description: 'Inventory description.')
      visit inventories_path
    end

    it 'should have the following content' do
      expect(page).to have_content('Inventory 01')
      expect(page).to have_content('Inventory description.')
      expect(page).to have_link('Remove')
    end

    it 'should link up to the show page' do
      click_link 'Inventory 01'
      expect(current_path).to eq(inventory_path(@inventory))
    end
  end
end
