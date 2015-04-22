Rails.application.routes.draw do
  
  # Root path of the application
  root 'dashboard#index'
  
  #Routes for products CRUD
  resources :products do
    resources :orders, only: [:new, :edit]
  end
  
  #Routes for orders CRUD
  resources :orders,  except: [:new, :edit]

end
