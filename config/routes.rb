Rails.application.routes.draw do
  root 'index#home'
  
  resources :blogs do
    patch 'delete', :on => :member
  end
  
end
