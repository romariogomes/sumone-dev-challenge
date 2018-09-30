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
  	@drinks = []
  	alcohol_level = params['alcohol_level']
  	distilled = params['distilled']
  	base_ingredient = params['base_ingredient']
  	temperature = params['temperature']

  	drinks = get_drinks
  	
  	exact_match = drinks.find_all {|drink| drink.base_ingredient == base_ingredient &&
									drink.distilled == distilled &&
									drink.temperature == temperature
								  }
	
	at_least_two_matches = drinks.find_all {|drink| (drink.base_ingredient == base_ingredient && drink.distilled == distilled) ||
											(drink.base_ingredient == base_ingredient && drink.temperature == temperature) ||
							  				(drink.temperature == temperature && drink.distilled == distilled)
							  			   }	
	
	at_least_one_match = drinks.find_all {|drink| drink.base_ingredient == base_ingredient ||
										  drink.distilled == distilled ||
									      drink.temperature == temperature
								  		 }
	
	if !exact_match.empty?
		exact_match = exact_match.sort_by {|drink| drink.rating_avg}
		exact_match = exact_match.reverse
		exact_match.each do |em|
	    	@drinks.push(em)
	    end	
	end

	if !at_least_two_matches.empty?
		at_least_two_matches = at_least_two_matches.sort_by {|drink| drink.rating_avg}
		at_least_two_matches = at_least_two_matches.reverse
		at_least_two_matches.each do |tm|
	    	@drinks.push(tm)
	    end	
	end

	if !at_least_one_match.empty?
		at_least_one_match = at_least_one_match.sort_by {|drink| drink.rating_avg}
		at_least_one_match = at_least_one_match.reverse
		at_least_one_match.each do |om|
	    	@drinks.push(om)
	    end	
	end
	
	if @drinks.empty?
		@drinks = drinks.sort_by {|drink| drink.rating_avg}
		@drinks = @drinks.reverse
	else
		@drinks = @drinks.uniq { |drink| drink.name }	
	end
  	
  	respond_to do |format|
	  format.js {render layout: false}
	end

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