Rails.application.routes.draw do
  get 'student/new', to: 'student#new'
  post 'student/create', to: 'student#create'

  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
