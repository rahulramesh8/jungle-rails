require 'rails_helper'

RSpec.describe Product, type: :model do

  context 'Validations' do

    before :each do
      @category = Category.new(name: "Mobile Phones")

      @sample_product = {
        name: "IPhone X",
        description: "New IPhone with fancy gimmicks that nobody really needs.",
        price_cents: 5000,
        quantity: 45
      }
    end

    it "should have a valid product" do
      @product = @category.products.new(@sample_product)
      expect(@product.valid?).to be true
      expect(@product.errors.full_messages).to be_empty
    end

    it "should raise error with a nil name field" do
      @sample_product[:name] = nil
      @product = @category.products.new(@sample_product)
      @product.save
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it "should raise error with a nil price field" do
      @sample_product[:price_cents] = nil
      @product = @category.products.new(@sample_product)
      @product.save
      expect(@product.errors.full_messages).to include "Price cents is not a number"
    end

    it "should raise error with a nil quantity field" do
      @sample_product[:quantity] = nil
      @product = @category.products.new(@sample_product)
      @product.save
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it "should raise error with a nil category field" do
      @product = Product.new(@sample_product)
      @product.save
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end

  end


end
