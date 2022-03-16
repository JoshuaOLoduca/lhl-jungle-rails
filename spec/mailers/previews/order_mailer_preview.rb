# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def summary
    @user = User.new(
      name: 'test',
      email: 'test@test.com',
      password: 'testy',
      password_confirmation: 'testy'
    )

    @category = Category.new(
      name: 'TestCat'
    )
    @product = Product.new(
      name: 'prod1',
      description: 'Prod Desc',
      image: open_asset('apparel3.jpg'),
      price_cents: 100,
      quantity: 2
    )

    @product2 = Product.new(
      name: 'prod2',
      description: 'Prod2 Desc',
      image: open_asset('apparel4.jpg'),
      price_cents: 100,
      quantity: 2
    )

    # @order = Order.new!(total_cents: 200,)
    @order = Order.new(
      email: @user.email,
      total_cents: 400,
      stripe_charge_id: 123_123 # returned by stripe
    )
    @order.id = -1

    @order.line_items.new(
      product: @product,
      quantity: 2,
      item_price: 100,
      total_price: 200
    )

    @order.line_items.new(
      product: @product2,
      quantity: 2,
      item_price: 100,
      total_price: 200
    )

    OrderMailer.summary @order
  end

  private

  # Helper functions
  def open_asset(file_name)
    File.open(Rails.root.join('db', 'seed_assets', file_name))
  end
end
