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

  def load_preferences_form
  	respond_to do |format|
	  format.js {render layout: false}
	end
  end

  def recommend_drink
  	@suggestion = []
  	alcohol_level = params['alcohol_level']
  	distilled = params['distilled']
  	base_ingredient = params['base_ingredient']
  	temperature = params['temperature']

  	if distilled.present? && base_ingredient.present? && temperature.present?
  		recommended_drink = Drink.where(base_ingredient: base_ingredient).where(distilled: distilled).where(temperature: temperature)
  		if recommended_drink.empty?
  			recommended_drink = Drink.where(base_ingredient: base_ingredient).or(Drink.where(distilled: distilled).or(Drink.where(temperature: temperature)))

  		end
  	elsif distilled.present? || base_ingredient.present? || temperature.present?
  		

  	end
  	

  	@sugestion = recommended_drink.uniq { |drink| drink.name }
  	# f.sort_by{|d| d.rating_avg}
  	# f = f.reverse
  	# recommended_drink = Drink.where(base_ingredient: base_ingredient).or(Drink.where(name: 'Mojito'))



  	require 'pry'
  	binding.pry
  end

  def calc_closest_alcohol_level_preference(level)
  	# h = ["7", "8", "11", "13", "14"].map(&:to_i).sort.group_by{|e| e <=> 11}
	# closest_alcohol_level = !h[0].nil? ? h[0] : h[-1].last || h[1].first
  end

  def get_drinks
	return Drink.all.order(:name).uniq { |drink| drink.name }	
  end

end
# a.sort_by {|obj| obj.alcohol_level}
# a = Drink.all.order(rating_avg: :desc)