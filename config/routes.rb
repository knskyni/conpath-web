Rails.application.routes.draw do
  get 'student/login', to: 'student#login'
  post 'student/login', to: 'student#auth'
  post 'student/logout', to: 'student#logout'
  get 'student/new', to: 'student#new'
  post 'student/new', to: 'student#create_temp'
  get 'student/activate/:auth_key', to: 'student#activate'
  post 'student/activate/:auth_key', to: 'student#create'
  get 'student/edit/:id', to: 'student#edit'
  post 'student/update/:id', to: 'student#update'

  root to: 'home#index'

  get 'school', to: 'school#index'
  get 'school/new', to: 'school#new'
  post 'school/create', to: 'school#create'
  get 'school/:id', to: 'school#show'
  get 'school/:id/edit', to: 'school#edit'
  patch 'school/:id/update', to: 'school#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
