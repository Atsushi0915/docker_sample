Rails.application.routes.draw do
  root 'posts#top'
  
  get  'users/new',   to:  'users#new'
  get  'users/index', to:  'users#index'
  post 'users/create', to: 'users#create'
end
