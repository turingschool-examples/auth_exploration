require 'rails_helper'

RSpec.describe 'As a Visitor' do
  describe 'When I visit the user index' do
    it 'I see all users in the database' do
      megan = User.create!(name: 'megan', email: 'megan@example.com', password: 'securepassword')
      brian = User.create!(name: 'brian', email: 'brian@example.com', password: 'supersecurepassword')

      visit users_path

      within "#user-#{megan.id}" do
        expect(page).to have_content(megan.name)
        expect(page).to have_content("email: #{megan.email}")
        expect(page).to_not have_content(megan.password)
      end

      within "#user-#{brian.id}" do
        expect(page).to have_content(brian.name)
        expect(page).to have_content("email: #{brian.email}")
        expect(page).to_not have_content(brian.password)
      end
    end
  end
end
