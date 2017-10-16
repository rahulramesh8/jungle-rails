require 'rails_helper'

RSpec.describe Product, type: :model do

  context 'Validations' do
    it {is_expected.to validate_presence_of (:name)}
    it {is_expected.to validate_presence_of (:price)}
    it {is_expected.to validate_presence_of (:quantity)}
    it {is_expected.to validate_presence_of (:category)}
  end

  context "Relationships" do
    before :each do
      @category = FactoryGirl.build(:category)
      @product = FactoryGirl.build(:product)
    end

    it "Should belong to Category" do
      @product.category = @category
      expect(@product.category).to eq(@category)
    end

  end
end
