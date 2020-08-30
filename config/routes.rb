Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :recipes
  resources :ingredients
  resources :steps
  root :to => 'recipes#index', as: 'home'
end
