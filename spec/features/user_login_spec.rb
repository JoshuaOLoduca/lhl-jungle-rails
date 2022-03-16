# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'UserLogins', type: :feature, js: true do
  # SETUP
  user_name = 'Ted Mosby'
  user_email = 'tedmosby@himym.com'
  user_password = 'password!'
  before :each do
    User.create! name: user_name, email: user_email, password: user_password, password_confirmation: user_password

    visit login_path
  end

  scenario 'User is redirected to root on login' do
    fill_in 'email', with: user_email
    fill_in 'password', with: user_password

    save_screenshot
    click_button 'Submit'

    expect(page).to have_content user_name
    expect(current_path).to eq root_path
  end

  scenario 'User can login with mixed case email' do
    fill_in 'email', with: user_email.upcase
    fill_in 'password', with: user_password

    click_button 'Submit'

    expect(page).to have_content user_name
    expect(current_path).to eq root_path
  end

  scenario 'User can login with trailing spaces on email' do
    fill_in 'email', with: " #{user_email} "
    fill_in 'password', with: user_password

    click_button 'Submit'

    expect(page).to have_content user_name
    expect(current_path).to eq root_path
  end
end
