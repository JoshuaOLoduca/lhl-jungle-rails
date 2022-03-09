class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_LOGIN'], password: ENV['ADMIN_PASSWORD']

  def show
    @product_count = Product.count
    @category_count = Category.count

    @category = {name: 'Category Count:' ,count: @category_count, link: nil}
    @product = {name: 'Product Count:' ,count: @product_count, link: admin_products_path}

    @store_summary = [@product, @category]
  end
end
