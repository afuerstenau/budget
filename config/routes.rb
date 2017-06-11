Rails.application.routes.draw do
  get 'budget/index'

  resources :activities
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
