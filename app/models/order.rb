class Order < ActiveRecord::Base

  after_create :reduce_quantity

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true
  validates :stripe_charge_id, presence: true

  private

  def reduce_quantity
    puts "Entering reduce_quantity function"
    line_items.each do |line_item|
      puts "Product id: #{line_item.product_id}"
      puts "Quantity: #{line_item.quantity}"

      new_product = line_item.product
      to_deduct = line_item.quantity.to_i
      new_product.quantity -= to_deduct
      new_product.save!
      puts "Quantity is: #{new_product.quantity}"
    end
  end

end
