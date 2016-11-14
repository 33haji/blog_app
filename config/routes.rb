Rails.application.routes.draw do
  root 'index#home'
  
  resources :blogs
end
