# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def summary(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: "Your Order: #{@order.id} From Jungle Book")
  end
end
