class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASS']

  def show
    @products = Product.all.count
    @categories = Category.all.count
  end
end
