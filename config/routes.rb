Rails.application.routes.draw do
  root to: 'home#index'
  get 'teacher/new', to: 'teacher#new'
  post 'teacher/create', to 'teacher#create'
end
