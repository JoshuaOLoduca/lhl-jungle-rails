# frozen_string_literal: true

class Order < ActiveRecord::Base
  after_create do |order|
    order.line_items.each do |line_item|
      product = Product.find line_item.product_id
      product.quantity -= line_item.quantity
      product.save!
    end
  end

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true
end
