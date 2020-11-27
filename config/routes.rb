Rails.application.routes.draw do
  root to: 'home#index'

  get 'teacher/new', to: 'teacher#new'
  post 'teacher/create', to: 'teacher#create'
  get 'teacher/edit/:id', to: 'teacher#edit'
  post 'teacher/update/:id', to: 'teacher#update'

end
