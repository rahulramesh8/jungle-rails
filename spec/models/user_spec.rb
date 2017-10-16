require 'rails_helper'

RSpec.describe User, type: :model do

  before :each do
    @user_sample = {
        name:  'Rahul',
        email: 'rahul@gmail.com',
        password: 'thepassword',
        password_confirmation: 'thepassword'
    }
  end

  context "Validations" do
    
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to have_secure_password}
  
    it "should raise error when password has fewer than 5 characters" do
      @user = User.new(@user_sample)
      @user.save!
      expect(@user.id).to be_present
    end

  end

  context ".authenticate_with_credentials" do
    it "should authenticate user with correct credentials" do
      @user = User.new(@user_sample)
      @user.save
      expect(User.authenticate_with_credentials(@user_sample[:email], @user_sample[:password])).to eq(@user)
    end
  end

end