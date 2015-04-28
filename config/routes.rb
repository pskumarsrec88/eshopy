Rails.application.routes.draw do
  
  resources :carts

  # Root path of the application
  root 'dashboard#index'
  
  #Routes for products CRUD
  resources :products do
    resources :carts, only: [:new, :edit]
  end
  
  #Routes for orders CRUD
  resources :carts,  except: [:new, :edit]
  
  #Routes for orders CRUD
  resources :orders

end
