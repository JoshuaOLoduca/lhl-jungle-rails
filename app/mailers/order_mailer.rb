# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def summary(order)
    @user = User.find_by_email order.email
    @order = order
    mail(to: @user.email, subject: "Your Order: #{@order.id} From Jungle Book")
  end
end
