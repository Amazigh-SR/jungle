require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do

    #testing an ideal scenario
    it "should validate when user has all 4 fields completed" do
      @user = User.new(name: "Saïd Redouane", email: "sredouane@rails.com ", password: "12345678", password_confirmation: "12345678")
      expect(@user).to be_valid
    end

    #Testing password and password confimation
    it "should not validate when the password and password confirmation don't match" do
      @user = User.new(name: "Saïd Redouane", email: "sredouane@rails.com", password: "12345678", password_confirmation: "87654321")
      expect(@user).to_not be_valid
    end

    it "should not validate without an email" do
    @user = User.new(name: "Saïd Redouane", password: "12345678", password_confirmation: "87654321")
    expect(@user).to_not be_valid
    end

    it "should not validate without a password & password confirmation" do
      @user = User.new(name: "Saïd Redouane", email: "sredouane@rails.com")
      expect(@user).to_not be_valid
    end

    it "should not validate without a name" do
      @user = User.new(email: "sredouane@rails.com", password: "12345678", password_confirmation: "12345678")
      expect(@user).to_not be_valid
    end

    it "should not validate if the password is not at least 8 characters" do
      @user = User.new(name: "Saïd Redouane", email: "sredouane@rails.com", password: "12345", password_confirmation: "12345")
      expect(@user).to_not be_valid
    end

    it "should not validate if email already exists" do
      @userA = User.new(name: "Saïd Redouane", email: "sredouane@rails.com", password: "12345678", password_confirmation: "12345678")
      @userA.save
      @userB = User.new(name: "Saïd Redouane", email: "sredouane@rails.com", password: "12345678", password_confirmation: "12345678")
      expect(@userB).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it "user can successfuly authenticate with the correct credentials" do
      @user = User.new(name: "Saïd Redouane", email: "sredouane@rails.com", password: "12345678", password_confirmation: "12345678")
      @user.save
      user = User.authenticate_with_credentials("sredouane@rails.com", '12345678')
      expect(user).to eq(@user)
    end
    it "user cannot successfuly authenticate with incorrect credentials" do
      @user = User.new(name: "Saïd Redouane", email: "sredouane@rails.com", password: "12345678", password_confirmation: "12345678")
      @user.save
      user = User.authenticate_with_credentials("sredouane@rails.com", "12345")
      expect(user).to_not eq(@user)
    end

  end




end
