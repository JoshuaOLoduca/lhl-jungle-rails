# frozen_string_literal: true

class Admin::AdminController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_LOGIN'], password: ENV['ADMIN_PASSWORD']
end
