require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create!(email: 'test@test.com', password: 'asdfghij', password_confirmation: 'asdfghij',
                         first_name: 'Harry', last_name: 'Potter')
  end
    
  describe 'creation' do
    it 'can be created' do
      expect(@user).to be_valid
    end

    it 'can not be created without first name, last name' do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end

  describe 'custom name methods' do
    it 'has a full name method' do
      expect(@user.full_name).to eq('POTTER, HARRY')
    end
  end
end
