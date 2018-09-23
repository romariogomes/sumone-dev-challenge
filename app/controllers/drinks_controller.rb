class DrinksController < ApplicationController
  
  def index
  
  end

  def search_drink
  	drinks_list = get_drinks
  	drink_name = params['drink_name'].downcase
  	@drinks = []

    drinks_list.each do |dl|
    	@drinks.push(dl) if dl.name.downcase.include?(drink_name)
    end
    
    respond_to do |format|
	  format.js {render layout: false}
	end
  	
  end

  def get_drinks
	return Drink.all.order(:name).uniq { |drink| drink.name }	
  end

end
