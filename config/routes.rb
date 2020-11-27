Rails.application.routes.draw do
  root to: 'home#index'

  get 'teacher/new', to: 'teacher#new'
  post 'teacher/create', to: 'teacher#create'
  get 'teacher/edit/:id', to: 'teacher#edit'
  post 'teacher/update/:id', to: 'teacher#update'
  get 'teacher/password_edit/:id', to: 'teacher#password_edit'
  post 'teacher/password_update/:id', to: 'teacher#password_update'

end
