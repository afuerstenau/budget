Rails.application.routes.draw do
  resources :transactions do
    collection { post :import}
  end
  
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
  
  get '/expenses/:id', to: 'expenses#show'
  
  root 'budget#index', as: 'budget_index'
end
