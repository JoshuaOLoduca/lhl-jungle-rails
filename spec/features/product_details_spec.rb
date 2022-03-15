require 'rails_helper'

RSpec.feature "Visitor clicks product to view details", type: :feature, js: true do
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

  after :each do
    save_screenshot
    expect(page).to have_css '.product-detail'
  end

  scenario "They can click on details button" do
    page.first('article.product').click_link('Details »')

    # Forces page to goto link clicked
    # AKA, This is a bug work around
    # PS: can also use sleep. but would rather use the below to run tests as fast as possible
    visit current_path
  end

  scenario "They can click on header (image and title)" do
    page.first('article.product > header').click

    # Forces page to goto link clicked
    # AKA, This is a bug work around
    # PS: can also use sleep. but would rather use the below to run tests as fast as possible
    visit current_path
  end

end
