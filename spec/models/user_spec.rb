require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    before do
      @user = User.new(name:"Jim Carrey", email:"jimisfunny@humor.ca", password:"ilikefrenchtoasts", password_confirmation:"ilikefrenchtoasts")
    end

    it "should have a name" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to_not be_empty
    end

    it "should have an email" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "should have password" do
      @user.password = nil
      @user.password_confirmation = nil
      @user.valid?
      expect(@user).to_not be_valid
    end

    it " passwords should match" do
      @user.password = "ilikefrenchtoasts"
      @user.password_confirmation = "ilik3fr3nchto@$t$"
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
    end

    it "password length should be a minimum of 5 characters" do
      @user.password = "abc"
      @user.password_confirmation = "abc"
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password is too short (minimum is 5 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      @user = User.new(name: "Jim Carrey", email: "jimisfunny@humor.ca", password: "ilikefrenchtoasts", password_confirmation: "ilikefrenchtoasts")
    end

    it 'should log the user in if email is correct' do
      @user.save
      expect(User.authenticate_with_credentials("jimisfunny@humor.ca", "ilikefrenchtoasts")).to_not be_nil
    end

    it 'should not log user in if email is incorrect' do
      @user.save
      expect(User.authenticate_with_credentials("jimisthefunniestwhenactingnatural@humor.ca", "ilikefrenchtoasts")).to be_nil
    end

    it 'should log the user when email contains spaces' do
      @user.save
      expect(User.authenticate_with_credentials("  jimisfunny@humor.ca ", "ilikefrenchtoasts")).to_not be_nil
    end

    it 'should log the user in if email is typed in wrong case ' do
      @user.save
      expect(User.authenticate_with_credentials("jimISfuNNy@humor.ca", "ilikefrenchtoasts")).to_not be_nil
    end
    
  end
end