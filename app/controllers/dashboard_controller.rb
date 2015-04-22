class DashboardController < ApplicationController
  def index
    @today = Order.created_between(Date.today)
    @week = Order.created_between(Date.today - 1.days, 7)
    @month = Order.created_between(Date.today - 1.days, 30)
  end
end
