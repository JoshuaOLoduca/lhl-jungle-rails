class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_LOGIN'], password: ENV['ADMIN_PASSWORD']

  def show
    @product_count = Product.count
    @category_count = Category.count
    @sale_active_count = Sale.active.count
    @sale_count = Sale.count

    @category = {name: 'Category Count:', count: @category_count, link: nil}
    @product = {name: 'Product Count:', count: @product_count, link: admin_products_path}
    @total_sales = {name: 'Total Sales:', count: @sale_count, link: admin_sales_path}
    @active_sales = {name: 'Active Sales:', count: @sale_active_count, link: admin_sales_path}

    @store_summary = [@product, @category, @total_sales, @active_sales]
  end
end
