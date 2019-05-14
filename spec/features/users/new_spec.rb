require 'rails_helper'

RSpec.describe 'As a Visitor' do
  describe 'When I visit user index' do
    it 'I can add a new user' do
      visit users_path

      click_link 'Register as User'

      expect(current_path).to eq(new_user_path)

      fill_in :user_name, with: 'megan'
      fill_in :user_email, with: 'megan@example.com'
      fill_in :user_password, with: 'securepassword'
      click_button 'Create User'

      expect(current_path).to eq(users_path)
      expect(page).to have_content('megan')
      expect(page).to have_content('megan@example.com')
    end
  end
end
