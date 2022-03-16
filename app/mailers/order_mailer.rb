# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def summary
    @user = params[:user]
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
