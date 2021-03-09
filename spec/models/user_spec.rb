require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation examples here
    it 'makes a valid user' do
      @user = User.new( first_name: "Test", last_name: "Name", email: "Test@Test.com", password: "12345", password_confirmation: "12345")
      expect(@user).to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end

end
