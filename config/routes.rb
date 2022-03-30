Rails.application.routes.draw do
  
  root 'posts#top'

  get '/login',   to:  'sessions#new',     as: 'login_form'
  post '/login',  to: 'sessions#create',   as:  'login'
  get  '/logout', to:  'sessions#destroy', as:  'logout'
  
  get  'users/new',    to:  'users#new'
  get  'users/index',  to:  'users#index'
  post 'users/create', to:  'users#create'

  get   'posts/new',          to: 'posts#new',     as:  'post_new'
  post  'posts/create',       to: 'posts#create',  as:  'post_create'
  get   'posts/index',        to: 'posts#index',   as:  'posts_index'
  get   'posts/:id/show',     to: 'posts#show',    as:  'post_show'
  get   'posts/:id/edit',     to: 'posts#edit',    as:  'post_edit'
  patch 'posts/:id/update',   to: 'posts#update',  as:  'post_update'
  get   'posts/:id/destroy',  to: 'posts#destroy', as:    'post_destroy'
end
