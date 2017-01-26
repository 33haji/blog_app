Rails.application.routes.draw do
  root 'index#home'
  
  namespace :profile do
    get :index
  end
  
  namespace :analysis do
    get :required_time
  end
  
  resources :tips do
    patch 'delete', :on => :member
  end
  
  resources :blogs do
    patch 'delete', :on => :member
  end
  
end
