class Order < ActiveRecord::Base
  after_create do |order|
    order.line_items.each do |line_item|
      product = Product.find line_item.product_id
      product.quantity -= line_item.quantity
      product.save!
    end

    user_id = session[:user_id]
    if user_id
      @user = User.find user_id
      @order = order
      OrderMailer.summary(@user, @order).deliver_later
    end
  end

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true
end
