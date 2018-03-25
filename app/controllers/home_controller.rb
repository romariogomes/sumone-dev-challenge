class HomeController < ApplicationController
  def index
    @drinks = Drink.all.order(created_at: :desc)
  end
end
