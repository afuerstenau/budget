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
  resources :plannedtransactions
  resources :categories
  get '/budget/:id', to: 'budget#show', as: 'budget_show_by_month'
  get '/budget/show_complete/:id', to: 'budget#show_complete'
  get '/budget/:id/:category_id', to: 'budget#show_by_category', as: 'budget_show_by_category'
  
  get '/expenses/:id', to: 'expenses#show'
  
  root 'budget#index', as: 'budget_index'
end
