require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'sees a link to log in' do
    visit users_path

    click_link 'Log In'

    expect(current_path).to eq('/login')
    expect(current_path).to eq(login_path)
  end

  it 'can log in as an existing user' do
    megan = User.create!(name: 'megan', email: 'megan@example.com', password: 'securepassword')

    visit login_path

    fill_in 'Email', with: megan.email
    fill_in 'Password', with: megan.password
    click_button 'Log Me In!'

    expect(current_path).to eq(users_path)
    expect(page).to have_content("Welcome #{megan.name}, you are logged in!")
    expect(page).to_not have_link("Log In")
  end
end
