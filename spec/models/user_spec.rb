require 'rails_helper'

RSpec.describe User, type: :model do

  context "Validations" do

    before :each do
      @user_sample = {
          name:  'Rahul',
          email: 'Rahul70077@gmail.com',
          password: 'hello123',
          password_confirmation: 'hello123'
      }

      @user = User.new(@user_sample)
    end
    
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


end
