require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
  end

  describe 'class methods' do
    it '.authenticate()' do
      megan = User.create!(name: 'megan', email: 'megan@example.com', password: 'securepassword')

      expect(User.authenticate(megan.email, megan.password)).to eq(true)
      expect(User.authenticate('brian@example.com', 'supersecurepassword')).to eq(false)
    end
  end
end
