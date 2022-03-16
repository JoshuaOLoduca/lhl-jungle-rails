# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      # Setup at least two products with different quantities, names, etc

      @category = Category.create! name: 'Apparel'

      @product1 = @category.products.create!(
        name: 'product 1',
        description: 'Desc for product 1',
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )

      @product2 = @category.products.create!(
        name: 'product 2',
        description: 'Desc for product 2',
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 2.99
      )
      # Setup at least one product that will NOT be in the order
    end
    # pending test 1
    it 'deducts quantity from products based on their line item quantities' do
      expect(@product1.quantity).to be 10
      expect(@product2.quantity).to be 10
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(
        email: 'fake@email.com',
        total_cents: 0,
        stripe_charge_id: 1 # returned by stripe
      )
      # 2. build line items on @order
      @order.line_items.new(
        product: @product1,
        quantity: 9,
        item_price: @product1.price * Sale.percentage,
        total_price: (@product1.price * 9) * Sale.percentage
      )
      @order.line_items.new(
        product: @product2,
        quantity: 10,
        item_price: @product2.price * Sale.percentage,
        total_price: (@product2.price * 10) * Sale.percentage
      )
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to be 1
      expect(@product2.quantity).to be 0
    end
    # pending test 2
    it 'does not deduct quantity from products that are not in the order' do
      # TODO: Implement based on hints in previous test
      expect(@product1.quantity).to be 10
      expect(@product2.quantity).to be 10
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new(
        email: 'fake@email.com',
        total_cents: 0,
        stripe_charge_id: 1 # returned by stripe
      )
      # 2. build line items on @order
      @order.line_items.new(
        product: @product1,
        quantity: 9,
        item_price: @product1.price * Sale.percentage,
        total_price: (@product1.price * 9) * Sale.percentage
      )
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to be 1
      expect(@product2.quantity).to be 10
    end
  end
end
