# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def summary
    @user = User.new(name: 'test', email: 'test@test.com', password: 'testy', password_confirmation: 'testy')

    @category = Category.new(name: 'TestCat')
    @product = Product.new(name: 'prod1', description: 'Duck u', image: 'https://i.cbc.ca/1.5963873.1616692705!/fileImage/httpImage/image.jpeg_gen/derivatives/original_780/face-off.jpeg', price_cents: 100, quantity: 2)

    # @order = Order.new!(total_cents: 200,)
    @order = Order.new(
      email: @user.email,
      total_cents: 200,
      stripe_charge_id: 123_123 # returned by stripe
    )

    @order.line_items.new(
      product: @product,
      quantity: 2,
      item_price: 100,
      total_price: 200
    )
    # default_url_options[:host] = 'localhost:3000'
    OrderMailer.summary @order
  end
end
