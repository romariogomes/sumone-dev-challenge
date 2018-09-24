Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'drinks#index'

  post   'search_drink'   => 'drinks#search_drink'
  post	 'load_preferences_form'   => 'drinks#load_preferences_form'
  post   'recommend_drink'   => 'drinks#recommend_drink'

  resources :home, only: %i[index]
end
