Rails.application.routes.draw do
  get 'student/activate/:auth_key', to: 'student#activate'
  post 'student/create', to: 'student#create'
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
