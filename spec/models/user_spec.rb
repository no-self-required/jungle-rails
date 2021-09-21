require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "should create a valid user" do
      user = User.create(
        first_name: "Jim",
        last_name: "Jimmyson",
        email: "Jim@joe.com",
        password: "strongpassword123",
        password_confirmation: "strongpassword123"
      )
      expect(user).to be_valid
    end
    
    it "should fail if either password field is missing" do
      user1 = User.create(
        first_name: "Jim",
        last_name: "Jimmyson",
        email: "Jim@joe.com",
        password: "strongpassword123"
        
      )
      user2 = User.create(
        first_name: "Jim",
        last_name: "Jimmyson",
        email: "Jim@joe.com",
        password_confirmation: "strongpassword123"
      )
      expect(user1).to_not be_valid
      expect(user2).to_not be_valid
    end

    it "should fail when passwords do not match" do
      user = User.create(
        first_name: "Jim",
        last_name: "Jimmyson",
        email: "Jim@joe.com",
        password: "password123",
        password_confirmation: "strongpassword123"
      )
      expect(user).to_not be_valid
    end

    it "should check for existing email" do
      user1 = User.create(
        first_name: "Jim",
        last_name: "Jimmyson",
        email: "Jim@joe.com",
        password: "strongpassword123",
        password_confirmation: "strongpassword123"
      )
      user2 = User.create(
        first_name: "Jim",
        last_name: "Jimmyson",
        email: "Jim@joe.com",
        password: "strongpassword123",
        password_confirmation: "strongpassword123"
      )
      expect(user2).to_not (be_valid)
    end

    it "should fail when password is has length less than 3" do
      user = User.create(
        first_name: "Jim",
        last_name: "Jimmyson",
        email: "Jim@joe.com",
        password: "23",
        password_confirmation: "23"
      )
      expect(user).to_not be_valid
    end

    describe ".authenticate_with_credentials" do
      it "should authenticate using class method" do
        user = User.create(
          first_name: "Jim",
          last_name: "Jimmyson",
          email: " JiM@joE.com ",
          password: "strongpassword123",
          password_confirmation: "strongpassword123"
        )
        authenticate = User.authenticate_with_credentials(user.email, user.password)
        expect(authenticate).to be_truthy
      end
    end

  end
end

