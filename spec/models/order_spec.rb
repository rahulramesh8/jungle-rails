require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      @category = Category.create!(name: "Mobile Phones")
      # Setup at least two products with different quantities, names, etc
      @product1 = @category.products.create!(
        name: "Iphone",
        description: "Apple nonsense", 
        price_cents: 6000000,
        quantity: 20,
      )
      @product2 = @category.products.create!(
        name: "Note 4",
        description: "Samsung's amazing phone", 
        price_cents: 3000000,
        quantity: 55,
      )
      # Setup at least one product that will NOT be in the order
      @product3 = @category.products.create!(
        name: "HTC ONE",
        description: "Some BS", 
        price_cents: 1000000,
        quantity: 14,
      )
    end

    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(
        email: "john@hotmail.com",
        total_cents: 9000000,
        stripe_charge_id: "4111 1111 1111 1111"
      )
      # 2. build line items on @order

      @line_item_1 = @order.line_items.new(
        product: @product1,
        quantity: 1,
        item_price: @product1.price,
        total_price: @product1.price * 1
      )
      @line_item_2 = @order.line_items.new(
        product: @product2,
        quantity: 2,
        item_price: @product2.price,
        total_price: @product2.price * 2
      )
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eq(19)
      expect(@product2.quantity).to eq(53)
    end
    # pending test 2
    it 'does not deduct quantity from products that are not in the order' do
      expect(@product3.quantity).to eq(14)
    end
  end
end