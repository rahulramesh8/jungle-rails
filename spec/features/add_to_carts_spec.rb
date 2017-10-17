require 'rails_helper'

RSpec.feature "User adds item to cart", type: :feature, js: true do

  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
      )
  end

  scenario "User can add item to a cart by clicking on Add Item" do
    visit root_path
    #Cart is the 2nd <a> tag on the page
    page.all(".product a")[1].click
    expect(page).to have_content("My Cart (1)")
    save_screenshot
  end

end