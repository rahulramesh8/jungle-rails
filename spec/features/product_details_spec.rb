require 'rails_helper'

RSpec.feature "User goes to product page", type: :feature, js: true do

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

  scenario "They can click on one of many products to go to show product page" do
    visit root_path
    #Since link_to gets converted to <a> tags in HTML
    page.all(".product a")[0].click
    expect(page).to have_css('.container')
    save_screenshot
  end

end