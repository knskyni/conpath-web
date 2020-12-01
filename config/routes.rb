Rails.application.routes.draw do
  root to: 'home#index'

  get 'teacher/new', to: 'teacher#new'
  post 'teacher/create', to: 'teacher#create'
  get 'teacher/:id/edit', to: 'teacher#edit'
  post 'teacher/:id/update', to: 'teacher#update'
  get 'teacher/:id/password_change', to: 'teacher#password_edit'
  post 'teacher/:id/password_change', to: 'teacher#password_update'

end
