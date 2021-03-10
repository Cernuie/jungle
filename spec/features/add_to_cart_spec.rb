require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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
    end
  
  scenario "They add an item and it shows in the cart" do
    visit root_path
    first(:button, "Add").click
    sleep(1)
    expect(page).to have_text 'My Cart (1)'
  end
end
