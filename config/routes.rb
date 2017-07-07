Rails.application.routes.draw do
  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users

  resources :activities
  resources :categories
  get '/budget/:id', to: 'budget#show'
  get '/budget/show_complete/:id', to: 'budget#show_complete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'budget#index', as: 'budget_index'
end
