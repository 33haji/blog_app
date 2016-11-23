Rails.application.routes.draw do
  root 'index#home'
  
  namespace :profile do
    get :index
  end
  
  resources :blogs do
    patch 'delete', :on => :member
  end
  
end
