require 'rails_helper'

RSpec.feature "Add To Cart", type: :feature, js: true do
       # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end

    visit root_path
  end
  
  scenario "Cart count goes up by 1 when item is added" do
    save_screenshot
    expect(page).to have_content 'My Cart (0)'
    
    page.first('article.product').click_button('Add')
    save_screenshot

    expect(page).to have_content 'My Cart (1)'
  end

end
