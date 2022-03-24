Rails.application.routes.draw do
  root 'posts#top'
  get 'posts/new'
  get 'posts/create'
  get 'posts/index'
  get 'posts/show'
  get 'posts/edit'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
