Rails.application.routes.draw do
  get 'student/create', to: 'student#create_form'
  post 'student/create', to: 'student#create'

  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
