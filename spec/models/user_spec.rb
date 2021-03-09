require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation examples here
    it 'makes a valid user' do
      @user = User.new( first_name: "Test", last_name: "Name", email: "Test@Test.com", password: "12345", password_confirmation: "12345")
      expect(@user).to be_valid
    end

    it 'is invalid without a first name' do
      @user = User.new( first_name: nil, last_name: "Name", email: "Test@Test.com", password: "12345", password_confirmation: "12345")
      expect(@user).to be_invalid
    end

    it 'is invalid without a last name' do
      @user = User.new( first_name: "Test", last_name: nil, email: "Test@Test.com", password: "12345", password_confirmation: "12345")
      expect(@user).to be_invalid
    end

    it 'is invalid without an email' do
      @user = User.new( first_name: "Test", last_name: "Name", email: nil, password: "12345", password_confirmation: "12345")
      expect(@user).to be_invalid
    end

    it 'is invalid if there is no password ' do
      @user = User.new( first_name: "Test", last_name: "Name", email: "Test@Test.com", password: nil, password_confirmation: "12345")
      expect(@user).to be_invalid
    end

    it 'is invalid if the passwords do not match' do
      @user = User.new( first_name: "Test", last_name: "Name", email: "Test@Test.com", password: "123456", password_confirmation: "1234567")
      expect(@user).to be_invalid
    end

    it 'is invalid if the password is less than 4 characters ' do
      @user = User.new( first_name: "Test", last_name: "Name", email: "Test@Test.com", password: "12", password_confirmation: "12")
      expect(@user).to be_invalid
    end

    it 'is invalid if there is already a user for that email ' do
      @user = User.new( first_name: "Test", last_name: "Name", email: "Test@Test.com", password: "12345", password_confirmation: "12345")
      @user.save
      @user2 = User.new( first_name: "Test", last_name: "Name", email: "Test@Test.com", password: "12345", password_confirmation: "12345")
      expect(@user2).to be_invalid
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end

end
