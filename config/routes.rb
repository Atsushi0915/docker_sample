Rails.application.routes.draw do
  
  root 'posts#top'

  get '/login',  to:  'sessions#new',  as: 'login_form'
  post '/login',  to: 'sessions#create', as:  'login'
  get  '/logout', to:  'sessions#destroy',  as:  'logout'
  
  get  'users/new',    to:  'users#new'
  get  'users/index',  to:  'users#index'
  post 'users/create', to:  'users#create'
end
