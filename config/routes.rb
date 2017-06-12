Rails.application.routes.draw do
  #get 'budget/index'

  resources :activities
  resources :categories
  get '/budget/:id', to: 'budget#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'budget#index', as: 'budget_index'
end
