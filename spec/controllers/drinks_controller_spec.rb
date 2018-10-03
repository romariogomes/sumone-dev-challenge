require 'rails_helper'
# require 'pp'

RSpec.describe DrinksController, type: :controller do

	it "responds successfully" do
	  get :index
      expect(response).to be_success
    end
	  
	it "responds successfully" do
      post :load_preferences_form, :format => 'js'
      expect(response).to be_success
    end

    it "responds successfully" do
      post :search_drink, :format => 'js'
      expect(response).to be_success
    end

    it "responds successfully" do
      post :recommend_drink, :format => 'js'
      expect(response).to be_success
    end
end
